# Base configuration to customize the look and funcionality of powershell. 

# Start by installing scoop and following the prompts to set-executionpolicy. [get scoop](scoop) 
# github: https://github.com/lukesampson/scoop
# github wiki: https://github.com/lukesampson/scoop/wiki


# Link to where I grabbed this from: https://github.com/lukesampson/scoop/wiki/Theming-Powershell

# utils
scoop install 7zip curl sudo git openssh coreutils grep sed less
scoop install git concfg

# now lets make the terminal more unix like and configure it to know git repositories and stuff, you will see in time.
# back-up current console settings
concfg export console-backup.json

# use solarized color theme
concfg import solarized-dark

# You'll see this warning:
#     overrides in the registry and shortcut files might interfere with
#     your concfg settings.
#     would you like to search for and remove them? (Y/n):
# Enter 'n' if you're not sure yet: you can always run 'concfg clean' later

scoop install pshazz