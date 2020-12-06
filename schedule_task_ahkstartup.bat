
set hn=hostname
WMIC computersystem where caption='%hn%' rename 'BuzaStation'


schtasks /Create /S BuzaStation /U faris /P Roadhogtime /XML AHKStartup.xml /TN AHKStartup
