@echo off
echo Opening AVERTIS Native Android Project in Android Studio...
cd /d "%~dp0frontend"
call npx cap open android
pause
