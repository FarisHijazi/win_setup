rem powershell.exe -Command "Start-Process cmd \"/k mklink ""%userprofile%\Start Menu\Programs\Startup\%~nx0\"" ""C:\Users\faris\Desktop\suggestive eyebrowse anime girl.gif\"" \" -Verb RunAs"
rem powershell.exe -Command "Start-Process cmd \"/k echo \"\"bkfst\"\" \" -Verb RunAs"
powershell.exe -Command "Start-Process cmd \"/k echo \"\"%~f0\"\" & pause\" -Verb RunAs"
rem powershell.exe -Command "Start-Process cmd \"/k mklink \"\"%userprofile%\Start Menu\Programs\Startup\%~nx0\"\" \"\"%~f0\"\" & echo %~f0 & pause\" -Verb RunAs"
