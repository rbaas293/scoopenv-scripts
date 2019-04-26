# scoopenv-scripts

## Get Dependencies

1. Open up `Powershell`

```PowerShell
# Set your execution policy so you can actually run stuff:
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
# Get and install scoop so we can move on to the scripts:
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
```

### Get The Scripts On Your Local Machine

* Two ways:
    1. Clone this Repository (obvious):
        * HTTPS: `git clone https://github.com/rbaas293/scoopenv-scripts.git`
        * SSH: `git clone git@github.com:rbaas293/scoopenv-scripts.git`
    2. ~~Run one-liner: **ex.**  `iex (iwr https://git.io/vbxjj)`. Check back in a bit for a real one-liner.~~



### Script Run Order

1. `base-config.ps1`
2. `add-buckets.ps1`
3. `dip_setup-env.ps1`

  To run a script in powershell, just type: `.\<script-name>`.

 Let it do the work or look inside the script and mannully install the stuff per command line. Enjoy my talking to myself in the comments! and remeber if you dont have conda, then just use `pip` or `pip3`.