:: Made by Peter R. Raozen (iBlueDust)
:: 19 Aug 2021

@echo off
if not exist QRes.exe (
	echo "This script needs QRes.exe to be in the same folder"
	echo "You can download QRes.exe from https://www.majorgeeks.com/files/details/qres.html"
	exit -1
)

wmic path Win32_Battery Get BatteryStatus | find /v "BatteryStatus" | find "1" >nul 2>&1
if "%errorlevel%" == "0" (goto battery) else (goto plugged_in)

:battery
echo [%DATE% %TIME%] Switched Monitor to 60 Hz>>"Dynamic Refresh Rate.log"
echo Switched Monitor to 60 Hz
QRes.exe /r:60
exit

:plugged_in
echo [%DATE% %TIME%] Switched Monitor to 165 Hz>>"Dynamic Refresh Rate.log"
echo Switched Monitor to 165 Hz
QRes.exe /r:165
exit