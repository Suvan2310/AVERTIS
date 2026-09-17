@echo off
echo ===================================================
echo   AVERTIS - SIH 2026 Android APK Builder
echo   Problem Statement: SIH26001
echo ===================================================

REM Set JAVA_HOME if Android Studio JBR exists
if exist "C:\Program Files\Android\Android Studio\jbr" (
    set "JAVA_HOME=C:\Program Files\Android\Android Studio\jbr"
    set "PATH=C:\Program Files\Android\Android Studio\jbr\bin;%PATH%"
)

echo [1/3] Building Web Assets (Vite + TypeScript)...
cd /d "%~dp0frontend"
call npm run build
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Web build failed.
    pause
    exit /b %ERRORLEVEL%
)

echo [2/3] Syncing Capacitor Native Android Project...
call npx cap sync android
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Capacitor sync failed.
    pause
    exit /b %ERRORLEVEL%
)

echo [3/3] Compiling Native Android Debug APK via Gradle...
cd /d "%~dp0frontend\android"
call gradlew.bat assembleDebug
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Gradle APK compilation failed.
    pause
    exit /b %ERRORLEVEL%
)

echo ===================================================
echo [SUCCESS] APK built successfully!
echo Output APK Location:
echo %~dp0frontend\android\app\build\outputs\apk\debug\app-debug.apk
echo ===================================================
pause
