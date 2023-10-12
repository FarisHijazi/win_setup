
# Add to startup context menu handler

## Description

The objective is to create a shortcut in "%userprofile%\Start Menu\Programs\Startup\"
however, it needs admin privileges

## Usage/Installation

Run the `install.bat` as administrator. Boom done

## Strategies

### To just run cmd in admin mode (somehow idk)

### That there must already be a privelaged cmd shortcut in system32 called `sudo.bat`

This command runs an elevated cmd instance

```cmd
powershell.exe -Command "Start-Process cmd \"/k cd /d %cd%\" -Verb RunAs"
```

Plan

1. Move `addToStartup.bat` and its shortcut to `c:\windows\` via elevated `.bat` file
2. Add registry entry, will contain command to run `addToStartup.lnk`

Use this command to do just that

```cmd
xcopy "%~dp0\sudo.bat" "c:\windows\"
```

## Some handy scripts

sudo, starts an elevated cmd from a normal cmd.
[See docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-6)

```cmd
powershell.exe -Command "Start-Process cmd \"/k cd /d %cd%\" -Verb RunAs"
```

```ps
Start-Process cmd "/k cd /d %cd%" -Verb RunAs
```

This is run on cmd, which calls powershell, which in turn calls a cmd instance (but as admin).

### lesson learned

In powershell, you escape double quotes like this: `""` NOT like this (`"`)

Creates a shortcut

```powershell
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Start Menu\Programs\Startup\%~n0.lnk');$s.TargetPath='%~f0';$s.Save()"
```

creates a symbolic link (admin rights required)

```cmd
mklink "%userprofile%\Start Menu\Programs\Startup\%~nx0" "%~f0"
```
