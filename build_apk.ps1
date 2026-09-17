# AVERTIS Android APK Build Script (Root PowerShell)
# Smart India Hackathon 2026 - Problem Statement SIH26001

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " AVERTIS ANDROID APK BUILD (SIH 2026)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Set Android Studio JBR Java Home if available
$JbrPath = "C:\Program Files\Android\Android Studio\jbr"
if (Test-Path $JbrPath) {
    $env:JAVA_HOME = $JbrPath
    $env:Path = "$JbrPath\bin;$env:Path"
    Write-Host "[INFO] Using Android Studio Java runtime: $JbrPath" -ForegroundColor DarkGray
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$FrontendDir = Join-Path $ScriptDir "frontend"

# Step 1: Web Assets Build
Write-Host "`n[1/4] Building Vite + TypeScript frontend web distribution..." -ForegroundColor Yellow
Set-Location $FrontendDir
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Frontend build failed!" -ForegroundColor Red
    Exit 1
}

# Step 2: Capacitor Sync
Write-Host "`n[2/4] Syncing Capacitor native Android assets & plugins..." -ForegroundColor Yellow
npx cap sync android
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Capacitor sync failed!" -ForegroundColor Red
    Exit 1
}

# Step 3: Gradle APK Compilation
Write-Host "`n[3/4] Compiling native Android APK with Gradle..." -ForegroundColor Yellow
$AndroidDir = Join-Path $FrontendDir "android"
Set-Location $AndroidDir
.\gradlew.bat assembleDebug
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Gradle build failed!" -ForegroundColor Red
    Exit 1
}

# Step 4: Verify APK Output
$ApkPath = Join-Path $AndroidDir "app\build\outputs\apk\debug\app-debug.apk"
Write-Host "`n[4/4] Verifying APK output..." -ForegroundColor Yellow

if (Test-Path $ApkPath) {
    $ApkItem = Get-Item $ApkPath
    $ApkSizeMb = [math]::Round($ApkItem.Length / 1MB, 2)
    Write-Host "`n========================================" -ForegroundColor Green
    Write-Host " BUILD SUCCESSFUL!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "APK Location: $ApkPath" -ForegroundColor White
    Write-Host "APK Size:     $ApkSizeMb MB" -ForegroundColor White
    Write-Host "Package ID:   in.gov.avertis.disaster" -ForegroundColor White
    Write-Host "Target SDK:   36 / Min SDK: 24" -ForegroundColor White
} else {
    Write-Host "[ERROR] APK file not found at expected path: $ApkPath" -ForegroundColor Red
    Exit 1
}
