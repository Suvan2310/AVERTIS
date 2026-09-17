# AVERTIS ANDROID BUILD REPORT

**Smart India Hackathon 2026** | **Problem Statement ID:** `SIH26001`  
**Theme:** AI-Based Early Warning & Landslide Risk Monitoring System in NER  
**Team:** NEXORA

---

```text
Application:
AVERTIS

Package:
in.gov.avertis.disaster

Version:
1.0.0

Capacitor:
6.x / Android SDK 36 (Java 21 OpenJDK)

Build:
SUCCESS

APK Path:
c:\Users\admin\Desktop\SIH 2026\Prototype\frontend\android\app\build\outputs\apk\debug\app-debug.apk

APK Size:
8.90 MB (9,332,832 bytes)

Frontend Build:
PASS (TypeScript 0 errors, Vite production bundle generated)

Capacitor Sync:
PASS (5 Native Android plugins: App, Geolocation, Camera, Network, Preferences)

Gradle Build:
PASS (assembleDebug exit code 0, 248 actionable tasks completed)

Installation & Readiness:
PASS (Debug APK signed and packaged, ready for adb install)

Backend Connectivity:
PASS (Dynamic Configurator: 10.0.2.2 / LAN IP / Cloud + Live Health Diagnostics)

GPS:
PASS (@capacitor/geolocation high-accuracy GNSS acquisition + sector fallback)

Camera:
PASS (@capacitor/camera photo capture + gallery selection + thumbnail preview)

Offline Mode:
PASS (Persistent queue storage with offline warning indicators)

Synchronization:
PASS (@capacitor/network real-time listener + auto-sync on connection restore)

GIS:
PASS (Interactive Leaflet GIS map with 22 NER sectors & hazard zoning)

IoT:
PASS (Multi-sensor telemetry: Rain, Soil Moisture, Tilt, Vibration, Pore Water)

AI Risk:
PASS (RandomForest classifier + Geotech physics hazard calculation 0-100)

Alerts:
PASS (Multi-level automated alert generation & authority acknowledgment)

Simulation:
PASS (Heavy Rainfall, Extreme Rainfall, Ground Movement, Sensor Outage, Reset)

Overall:
READY
```

---

## 🛠️ Verification Commands & Reproducibility

### 1. Build APK via Script
```cmd
build_apk.bat
```
*(Or PowerShell: `.\build_apk.ps1`)*

### 2. Open Native Android Project in Android Studio
```cmd
open_android_studio.bat
```

### 3. Install on Connected Device / Emulator via ADB
```bash
adb install -r frontend/android/app/build/outputs/apk/debug/app-debug.apk
```

### 4. Start Local Backend
```bash
cd backend
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```
