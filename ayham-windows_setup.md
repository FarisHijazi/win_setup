# Settings to change
## Registry
**Note: backup registry before editing**
- enable "Recycle Bin" in "This PC"
    - navigate to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace`
    - create key `{645FF040-5081-101B-9F08-00AA002F954E}`
- remove "3D Objects"
    - navigate to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace`
    - delete `{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}`
    - navigate to `HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace`
    - delete `{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}`
- remove "Music"
    - delete `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}`
    - delete `HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}`
- remove "Documents"
    - delete `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}`
    - delete `HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}`

## Misc
- Display -> Graphics -> Enable "Hardware-accelerated GPU scheduling"
- Change default location for (Desktop, Pictures, Videos, etc)
- Change Display refresh rate
- Nvidia Control Panel (After installing driver & restarting)
- Disable Mouse Property: Enhance Pointer Precision
- Schedule de-fragment (Once per week)
- Always show hidden files
- Disable Indexing on each Storage device
- Setup windows Auto-backup
- Uninstall Programs
- Disable "Windows Features" (after rebooting, click Steam desktop
- uninstall "Windows Optional Features"
- icons, & change the default "Open With" option to an Internet Browser)
- Auto start any app: run `Run` -> `shell:startup` -> add shortcut
- Network -> Change Adapter Options -> click on each adapter -> Properties -> Configure -> Power Management -> disable Allow This Device To Wake Up Computer
- Network -> Advanced Sharing Options
- Clear OS drive from clutter folders
- Sound -> Communications -> "Do Nothing"
- Performance settings
- File Explorer options
- Bitlocker
- Windows Defender settings
- Mouse Properties -> turn off "Enhance Pointer Speed"
- Setup DNS for ip4 & ip6 for each network adapter
- Motherboard drivers
- disable some Task Manager Auto-Start apps
- Optional: de-bloat windows: https://github.com/Disassembler0/Win10-Initial-Setup-Script
- wallpaper + lock screen: `#D9D9D9` (white - 75% brightness)
- launch apps on startup: add shortcut to `C:\Users\ayham\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

## Windows Backup
If re-using a harddrive, go to control panel (from Advanced Settings in Backup), then select Advanced Settings & select a backup to continue using.
### Include
- the entire drive
- explicitly include Libraries that have been moved to the drive (e.g. Photos, Downloads)
- `C:\Users\ayham\AppData\Local`
- `C:\Users\ayham\AppData\Roaming`
### Exclude
- `D:\$Recycle.Bin`

## Control Panel
- User Account Control
- Allow Remote Access
- Power Options -> High Power -> Edit Plan Settings -> Advanced
- Flash Player

# Debloating

## todo check these
- How to trim down windows 10 (services & background processes): check privacytools.io & debloating scripts!
- [Windows 10 Debloat script](https://github.com/Disassembler0/Win10-Initial-Setup-Script)
- - Create a Windows VM, run debloat init script + disable windows features + https://youtu.be/-N1jBvmunzg +  the following services: -
    - Connected User Experiences and Telemetry (To turn off Telemetry and Data Collection)
    - Diagnostic Policy Service
    - Diagnostic Tracking Service (To turn off Telemetry and Data Collection)
    - dmwappushsvc (To turn off Telemetry and Data Collection)
    - Downloaded Maps Manager (If you don't use Maps app)
    - IP Helper (If you don't use IPv6 connection)
    - Program Compatibility Assistant Service
    - Remote Registry (You can set it to DISABLED for Security purposes)
    - Secondary Logon
    - Security Center (Check this)
    - TCP/IP NetBIOS Helper (If you are not in a workgroup network)
    - Touch Keyboard and Handwriting Panel Service (If you don't want to use touch keyboard and handwriting features)
    - Themes (this will disable aero effects, your windows machine won't look as nice)
    - Windows Defender Service (If you don't use Windows Defender program)
    - Windows Error Reporting Service
    - Windows Image Acquisition (WIA) (If you don't have a scanner)
    - Windows Push notification Service
    - Windows Search (If you don't use Windows Search feature frequently) (Check this)