# Setting up a new computer for Faris

Here list the things that you need and the settings that you change then just turn it into a bat file
it's finally time to make this happen

setting up a computer to be in Farise's standards with just a single click, and some waiting


- [ ] create a local account without a microsoft account and choose the name, this way you can be sure to choose the user folder name
- [ ] open Edge and install chrome
- [ ] change mouse speed
- hold click repeat keyboard setting change
- NVIDIA control panel:
  - Change resolution: set to 144hz
  - Manage 3D settings:
    - Vertical sync: fast
    - Power management mode: Prefere maximum performance
    - monitor technology: fixed refresh rate
- Explorer: view > options > Open file explorer to: "This PC"
- Chrome: 
  - sign in
  - set as default
  - open dropbox: <https://www.dropbox.com/preview/_Folder_/pc_setup/PC_setup.md?role=personal>
- [ ] set PC name
- [ ] ensure that partition "d" has drive letter D
- [ ] Pin `D:\home` to quick access
- [ ] relocate (documents, videos, pictures) to their clones in D:\
- [ ] add toolbar for downloads
- [ ] type UAC and set slider all the way down
- [ ] expose ports https://winaero.com/open-port-windows-firewall-windows-10/
- [ ] exclude folders from antivirus scanning https://support.microsoft.com/en-us/windows/add-an-exclusion-to-windows-security-811816c0-4dfd-af4a-47e4-c301afe13b26#:~:text=Go%20to%20Start%20%3E%20Settings%20%3E%20Update,%2C%20file%20types%2C%20or%20process.

```powershell
# WARNING: may RESTART the PC
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

```


## downloads

```powershell

# enable running scripts:
set-executionpolicy remotesigned

# windows 10 debloater:
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))
```

### Download and install chocolatey

```powershell

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

refreshenv
choco upgrade chocolatey
choco feature enable -n allowGlobalConfirmation

choco install -y dropbox --pre
choco install -y git
choco install -y gsudo
choco install -y zip
choco install -y googlechrome
choco install -y vscode
choco install -y lghub
choco install -y windirstat
choco install -y everything --params "/start-menu-shortcuts /run-on-system-startup /folder-context-menu /efu-association /client-service"
choco install -y es
choco install -y dupeguru
choco install -y powertoys
choco install -y autohotkey
choco install -y lightshot
choco install -y qbittorrent
choco install -y linkshellextension
choco install -y haskell-stack
choco install -y origin
choco install -y 7zip
choco install -y unzip
choco install -y ffmpeg
choco install -y rclone
choco install -y epicgameslauncher
choco install -y battle.net ## warning this needs a "y"
choco install -y openssh
choco install -y vlc
choco install -y steam
choco install -y barrier
choco install -y discord
choco install -y jetbrainstoolbox
choco install -y pasteintofile
choco install -y click-monitor-ddc
choco install -y mingw
choco install -y ngrok Firefox tor-browser
# Install original packages...
# Nvidia graphics driver (in case you'd need it)
choco install -y geforce-experience
choco install -y geforce-game-ready-driver-win10
choco install -y usbip
choco install -y crystaldiskmark
choco install -y eartrumpet
choco install -y msiafterburner
choco install -y tailscale

choco install -y notion
choco install -y obs-studio
choco install -y docker-cli
choco install -y docker-machine
choco install -y docker-compose
choco install -y docker-desktop
choco install -y syncthing
choco install -y warp

# Some tools...
choco install -y 7zip.install
choco install -y googledrive
choco install -y notepadplusplus.install
choco install -y treesizefree

# Development stuff...
choco install -y dotnet4.6.2
choco install -y dotnet4.7.2
choco install -y dotnetcore
# Fun with Visual Studio 2017... other versions are available too
choco install -y VisualStudio2017Professional
choco install -y visualstudio2017-workload-netweb
choco install -y visualstudio2017-workload-netcoretools

# Install WebPI packages
choco install -y IISExpress10 -source webpi
choco install -y WindowsAzurePowershellGet -source webpi
choco install -y WindowsInstaller45 -source webpi

choco install -y cygwin
choco install -y miniconda3 --params="'/AddToPath:1 /RegisterPython:1'"
choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System'

# winget install -y -e --id Docker.DockerDesktop
```

install openssh
```powershell
cd "C:\Program Files\OpenSSH-Win64"
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22
Set-Service sshd -StartupType Automatic
net start sshd
```

### [Authenticate SSH keys for the SSH server](https://superuser.com/a/1697321):

in powershell, run:
```powershell
"C:\ProgramData\ssh\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"
```

Copy `id_rsa.pub` file to windows server at location `C:\ProgramData\ssh\administrators_authorized_keys` (you might have to create this file)

be aware that `sshd_config` is in `C:\ProgramData\ssh\sshd_config`


```sh
# create ~/bin
mkdir ~/bin; cd ~/bin
curl -L "https://github.com/H-M-H/Weylus/releases/download/v0.11.4/Windows.zip" > weylus.zip && unzip weylus.zip && rm weylus.zip
```

- [ ] symbolic link `D:\home\bin` to `C:\Users\faris\bin`
- [ ] disable shift+alt to change languages, go to language > keyboard > input language hotkeys
- [ ] download drivers from this site: https://rog.asus.com/motherboards/rog-strix/rog-strix-x299-e-gaming-ii-model/helpdesk_download/
- [ ] hold down shift and disable sticky keys hotkey
- [ ] fancy zones change settings
- [ ] make a backup of those settings ????
- [ ] signin with Thiqah onedrive
- [ ] disable UAC, make sure account is admin
- [ ] set wallpaper
- [ ] restore cookies and sessions (put them in chrome program files)
- [ ] change wallpaper
- [ ] set static IP addresses
- [ ] task scheduler run AHK
- [ ] imageglass: launch and set default
- [ ] 7zip file manager: launch and set default
- [ ] add scattered steam folder to steam
- [ ] add border around active window: settings > personalization > colors > Title bars and windows borders
- [ ] clean bookmarks (deduplicate and remove annoying empty folders)
- [ ] powertoys disable coffee and mouse stuff
- [ ] `echo "C:\Program Files\Git\git-bash.exe --cd-to-home" >> ~/init.cmd`
- [ ] modify "C:\tools\Anaconda3\condabin\conda_hook.bat" (add `conda activate base`)
- [ ] qbittorrent dark theme: q
- [ ] add synology NAS `\\FarisNAS\main`

- [ ] disable activity history in settings (to disable taskview activity history)
- [ ] add git-bash to path "C:\Program Files\Git\bin" and add alias git-bash: "C:\Program Files\Git\bin\bash.exe" --login -i
- [ ] setup filehistory
- [ ] jupyter server setup for remote access
  ```bash
  yes|jupyter notebook --generate-config
  yes|jupyter lab --generate-config
  echo 'c.NotebookApp.ip = "0.0.0.0"
  c.ServerApp.allow_remote_access = True' | tee -a ~/.jupyter/jupyter_notebook_config.py ~/.jupyter/jupyter_lab_config.py

  jupyter notebook password
  jupyter lab password
  ```
- [ ] in init.cmd set `doskey git-bash="C:\Program Files\Git\bin\bash.exe" --login -i`

- [ ] route the 0.0.0.0 to localhost:
  run as admin

  ```cmd
  echo "    0.0.0.0         localhost" >> C:\Windows\System32\drivers\etc\hosts
  ```
- [ ] setup periodic backup scripts
- [ ] schedule AHK and SSHD on startup and on logon
- [ ] linux install cuda
- [ ] rclone add pcloud
- [ ] download pcloud
- [ ] change date format

```
wsl --update
wsl --set-version Ubuntu-20.04 2

wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-wsl-ubuntu-11-8-local_11.8.0-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-11-8-local_11.8.0-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

```

<!-- - [chrome](https://www.google.com/chrome/)
- [Dropbox](https://www.dropbox.com) - [dl](https://www.dropbox.com/downloading)
- anaconda3 -->
<!-- - python -->
<!-- - HardlinkShell - [dl](http://schinagl.priv.at/nt/hardlinkshellext/HardLinkShellExt_X64.exe)
- everything (by voidtools) [dl](https://www.voidtools.com/Everything-1.4.1.935.x64-Setup.exe)
- [AHK](https://www.autohotkey.com/download/) - [dl](https://www.autohotkey.com/download/ahk-install.exe)
- [files2folder](http://www.dcmembers.com/skwire/download/files-2-folder/#) - [dl](http://www.dcmembers.com/skwire/download/files-2-folder/?wpdmdl=273&refresh=5d1209730122a1561463155)
- [vscode](https://code.visualstudio.com/download) - [dl](https://aka.ms/win32-x64-user-stable)
  - vscode extension sync and gist key
  > access token: 730e2a979ec1d693e6617d002ac93eb82f3a3f4c  
  > gist id:  21b019f4594697ee499b40a7182df6bd  
  > `"sync.gist": "21b019f4594697ee499b40a7182df6bd"`   -->

- change date format in windows
- disable windows app notifications
- lghub and setup `C:\Users\f\Dropbox\_Folder_\win_setup\LGHUBconfigs`
- powertoys
  - make fancy zones, set margin=0
- vscode allow settings sync, sign in to Github theefaris@gmail.com
- open PowerToys:
  - restart as administrator
- Tampermonkey:
  - after opening chrome and extensions install, download tampermonkey scripts. Google drive, choose last one at bottom
  - go to "manage extension" and "allow access to file URLs" ( same for dark reader)
  - go to scripts and disable all duplicates ( visit google and disable the first 8)
- download expressvpn
- explorer: drag user "faris" to quickaccess
- copy and paste dot files
- NVIDIA Geforce Experience:
  - activate shadowplay
  - privacy > enable desktop capture, rebind keys: ctrl+shift+alt+z, and disable ` for push-to-talk

Drivers:
- `"D:\home\Downloads\Drivers rog strix x299-e gaming ii\DRV_MEI_Intel_Cons_KBL_TP_W10_64_V19521401470_20200710R\AsusSetup.exe"`
- `"D:\home\Downloads\Drivers rog strix x299-e gaming ii\DRV_VROC_Intel_HEDT_TP_W10_64_VER6201239_20191108R\Install\AsusSetup.exe"`

## settings

- disable shift+alt changing language:
  > serach for "language" > spelling and keyboard settings > advanced keyboard settings > input language hot keys > disable all
- disable windows indexing
  ```
  "C:\Windows\System32\mmc.exe" services.msc
  ```
- disable superfetch
- power settings: high performance mode
- power settings: disable sleep
- disable UAC warning
- disable "hide extensions for known file types"
- keybaord hold speed:
  ```
  "C:\Windows\System32\rundll32.exe" C:\Windows\System32\shell32.dll,Control_RunDLL "C:\Windows\System32\main.cpl,@1,"
  ```
- mouse sensitivity
- replace powershell with cmd
- disable timeline (recent files in task-view) [see here](https://www.howtogeek.com/348138/how-to-disable-the-timeline-on-windows-10/#:~:text=Click%20the%20Start%20button%2C%20and,activities%20from%20this%20PC%E2%80%9D%20checkbox). search for "activity history" and disable those
- disabling background apps
- Dropbox: disable sharing screenshots `import > uncheck "share screenshots using Dropbox"`

- Laptop: touchpad triple click = middle mouse button
- Laptop: lid close: do nothing
- mouse scroll set to 7 lines

## file assocations

- zip files: 7zip
- browser: chrome
- pdf: chrome

## run at startup

- main.ahk
- clipboard history

## registry

- disable web search results
- drag moves by default
- disable onedrive

## context menu

- remove the "Send to" context menu item

## misc

- setup onedrive
- change location of user/downloads, user/videos, user/pictures..
- add toolbars to taskbar: D:\home, C:\Users\faris\Dropbox\_Folder_\QuickAccess


## Game launch options:

### Doom
`+com_SkipIntroVideo 1 set m_smooth 0 com_skipKeyPressOnLoadScreens 1 +menu_advanced_AllowAllSettings 1  +com_gameMode 1`

### Doom Eternal
`+com_skipIntroVideo 1 +com_skipKeyPressOnLoadScreens 1 -high -USEALLAVAILABLECORES`

### Apex Legends

`+cl_showfps 4`

## Resources

Links:

- <https://github.com/W4RH4WK/Debloat-Windows-10>
- <https://4sysops.com/archives/disable-windows-10-telemetry-with-a-powershell-script/>
- <https://geekylifestyle.com/remove-windows-10-bloat-with-this-amazing-script>
- <https://gist.githubusercontent.com/matthewjberger/2f4295887d6cb5738fa34e597f457b7f/raw/b23fa065febed8a2d7c2f030fba6da381f640997/Remove-Windows10-Bloat.bat>
- that powershell script that disables windows telemetry and stuff

## Restore Microsoft store

In case you've deleted you're microsoft store, you can use this repo to get it back: https://github.com/kkkgo/LTSB-Add-MicrosoftStore

