@echo off
:: Generate timestamp
for /f %%i in ('powershell -command "Get-Date -Format yyyyMMdd_HHmmss"') do set timestamp=%%i

:: Folder to save logs
set folder=android_logs_%timestamp%
mkdir %folder%

echo Collecting device information...

:: Device model
adb shell getprop ro.product.model > %folder%\device_model_%timestamp%.txt

:: Android version
adb shell getprop ro.build.version.release > %folder%\android_version_%timestamp%.txt

:: Logcat logs
adb logcat -d > %folder%\logcat_%timestamp%.txt

:: Installed packages
adb shell pm list packages > %folder%\packages_%timestamp%.txt

:: Running processes
adb shell top -n 1 > %folder%\processes_%timestamp%.txt

echo All logs saved to folder: %folder%
pause
