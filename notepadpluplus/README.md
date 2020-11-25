# Create `Open with Notepad++` Context Menu Option

Due to the Portable version of notepad++ not including the required dll (`NppShell_06.dll` in my case), I found it nessesary to create a script to create the 
context menu option. 

## Usage:
```PowerShell
.\create_npp_context_menu.ps1 [-Uninstall][-NppDirectory <string>][-InDLL <string>][-Verbose]
```

### Default Parameter Values

* __-Uninstall__: `false`.

* __-NppDirectory__: `current`. 
	
	This default is set in order to make easy runability when the `dll` and `script` are located in the base _scoop notpadplusplus_ directory. 
	i.e. `~\scoop\apps\notpadplusplus\`.

* __-InDLL__: `null`.
	
	If the user does not passes a specific `dll` file, search for one in the current directory. 
