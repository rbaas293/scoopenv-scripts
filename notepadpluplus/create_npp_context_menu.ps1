[CmdletBinding()]
Param(
	
	[switch]$Uninstall = $False,
	[Alias('NppDir')][string]$NppDirectory='current',
	[string]$InDLL
)
Write-Verbose "Notepad++ Directory = ${NppDirectory}"

# If InDLL was not passed, then search for one in the current directory
if (!$InDLL) {
	$DllExists = $false
	Get-ChildItem -File | ForEach-Object {
		if ($_.Name -like 'NppShell*.dll') {
			$DLL = $_
			$DllExists = $true
		}
	}
	if (!$DllExists) { throw "Could not find a NppShell*.dll is the current directory" }
}
Else { 
	if (!(Test-Path -Path $InDLL -Type Leaf)) { throw "InDLL Does Not Exist: ${InDLL}" }
	$DLL = $InDLL
}

Write-Verbose "DLL = $($DLL.Name)"

# Check NppDirectory by seeing if notepad++.exe exists
$NppExists = $False
if (Test-Path -Path $NppDirectory -Type Container) {
	Get-ChildItem $NppDirectory | ForEach-Object {
		if ( $_.Name -eq "notepad++.exe" ) {
			$NppExists = $true
		}
	}
	if (!$NppExists) { throw "Notepad++.exe Does Not Exist in ${NppDirectory}" }
}
Else { Throw "Notepad++ Directory Does Not Exist: ${NppDirectory}" }
	


# Figure out if the dll exists in the $NppDirectory, if not then copy it. 
if (!(Test-Path -Path $NppDirectory\$DLL.Name))
{
	Try 
	{
		Copy-Item $DLL $NppDirectory
	}
	Catch { Throw "Copy-Item Failed." }
}

$Exe_DLL = "${NppDirectory}\$($Dll.Name)"


Try
{
	if (gcm -Name sudo) {
		Write-Output "A Prompt May Appear."
		if (!$Uninstall) {
			sudo regsvr32 /s /i $Exe_DLL
		}
		Else {
			sudo regsvr32 /s /u $Exe_DLL
		}
	}
	Else { 
		#Checks if the user is in the administrator group. Warns and stops if the user is not.
		if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
			Set-Location $PSScriptRoot
			throw "You are not running this as local administrator. Run it again in an elevated prompt."
		}
		Write-Output "A Prompt May Appear."
		if (!$Uninstall) {
			regsvr32 /s /i $Exe_DLL
		}
		Else {
			regsvr32 /s /u $Exe_DLL
		}
	}
}
Catch { Set-Location $PSScriptRoot ; Throw 'Something Went Wrong: Error: $Error[0]'}

Write-Output "Done"
Set-Location $PSScriptRoot	

