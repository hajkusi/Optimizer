if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\RunAsTI.bat" (goto HoneCacheFile) else DownloadHoneCacheFile
:DownloadHoneCacheFile
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming_Pack\Resources\RunAsTI.bat" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/RunAsTI.bat"

whoami /user | find /i "S-1-5-18" > nul 2>&1 || (
	call RunAsTI.cmd "%~f0" "%*"
	exit /b
)
cd %SYSTEMDRIVE%\Gaming_Pack\Resources\
for /f "tokens=* delims=\" %%i in ('FilePicker.exe exe') do (
    if "%%i" == "cancelled by user" exit /b 1
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Application Name" /t REG_SZ /d "%%~ni%%~xi" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "DSCP Value" /t REG_SZ /d "46" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Local IP" /t REG_SZ /d "*" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Local Port" /t REG_SZ /d "*" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Protocol" /t REG_SZ /d "*" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Remote IP" /t REG_SZ /d "*" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Remote Port" /t REG_SZ /d "*" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Throttle Rate" /t REG_SZ /d "-1" /f > nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Version" /t REG_SZ /d "1.0" /f > nul
)

echo Finished, Please Reboot Your Device For Changes To Apply.\Zakonczono, Prosze Uruchom Ponownie Twoje Urzadzenie zeby Zastosowac
pause
exit /b