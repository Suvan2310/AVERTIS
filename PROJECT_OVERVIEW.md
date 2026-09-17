# AVERTIS — Comprehensive System Overview & Technical Reference

**Project Name:** AVERTIS (AI-Based Early Warning & Landslide Risk Monitoring System in NER)  
**Smart India Hackathon 2026 | Problem Statement ID:** `SIH26001`  
**Theme:** Disaster Management (North Eastern Region of India)  
**Team:** NEXORA  
**Target Platform:** Web (React 19 / Vite / Tailwind CSS v4) + Mobile (Native Android APK via Capacitor) + Embedded IoT (ESP32 C++) + Cloud/Edge Backend (FastAPI / Scikit-Learn / SQLite)

---

## 📋 Table of Contents
1. [Executive Summary & What Has Been Done](#1-executive-summary--what-has-been-done)
2. [Complete Technology Stack & Tools Used](#2-complete-technology-stack--tools-used)
3. [End-to-End Architecture](#3-end-to-end-architecture)
4. [Comprehensive File & Directory Breakdown](#4-comprehensive-file--directory-breakdown)
5. [AI / Machine Learning Model Pipeline](#5-ai--machine-learning-model-pipeline)
6. [IoT Edge & Hardware Telemetry](#6-iot-edge--hardware-telemetry)
7. [Android Mobile Application & APK Build](#7-android-mobile-application--apk-build)
8. [Demonstration Scenarios for Evaluators](#8-demonstration-scenarios-for-evaluators)
9. [How to Run & Reproduce](#9-how-to-run--reproduce)

---

## 1. Executive Summary & What Has Been Done

**AVERTIS** is a closed-loop, full-stack disaster management and early warning decision-support system designed specifically for the rugged terrain and extreme monsoon precipitation patterns of the **8 North Eastern States** of India:
1. **Meghalaya** (Cherrapunji-Mawsynram Escarpment, Shillong Peak, Nongstoin)
2. **Sikkim** (Gangtok-Tathangchen Slope, Dikchu-Mangan Highway NH-310A, Namchi)
3. **Assam** (Guwahati Kamakhya Hills, Haflong-Jatinga Mountain Highway NH-54E)
4. **Mizoram** (Aizawl-Laipuitlang Fault Zone, Bawngkawn-Durtlang Scarp, Lunglei)
5. **Nagaland** (Kohima-Phesama Bypass NH-29, Zubza Valley, Mokokchung)
6. **Manipur** (Tupul-Noney Railway Incline Sector, Langol Hills, Senapati-Mao Pass)
7. **Arunachal Pradesh** (Itanagar-Hollongi Belt, Bhalukpong-Tenga Gorges, Tawang)
8. **Tripura** (Jampui Hills Ridge Crest, Agartala-Baramura Cut)

### Key Achievements & Completed Modules:
- **Full-Stack GIS Web Application:** Interactive Leaflet GIS mapping with 22 polygon-defined NER zones, multi-basemap switcher (Esri Dark Tactical, High-Res Satellite 3D, Topographic Relief, OpenStreetMap), and real-time hazard color indicators.
- **AI/ML Geotechnical Risk Engine:** Trained Scikit-Learn Random Forest Classifier that computes continuous hazard scores ($0-100$) combining precipitation, soil saturation, slope angle, pore-water pressure, and ground tilt.
- **Multi-Sensor IoT Network & Simulator:** Real-time telemetry ingestion pipeline for physical ESP32 nodes and a background Python telemetry streaming daemon.
- **Automated Early Warning & Alerts:** Threshold-based alert generation with automatic severity ranking (CRITICAL, HIGH, MODERATE, LOW), acknowledgment logs, and simulated SMS emergency dispatch.
- **Offline-Ready Native Android APK:** Field Officer mode with high-accuracy GNSS geotagging, on-device camera evidence capture, offline queue storage, and automatic sync when network is restored. Packaged into a standalone Android APK (`AVERTIS_Latest_SIH26001.apk`).
- **Citizen Crowdsourcing Portal:** Public web portal for community incident reporting with photo attachments and safety advisories.
- **Interactive Hackathon Simulation Suite:** 1-click live simulation toolbar demonstrating heavy rainfall surges, ground tilt, sensor node failures, and baseline resets.

---

## 2. Complete Technology Stack & Tools Used

| Layer | Technology / Tool | Version / Spec | Purpose |
|---|---|---|---|
| **Frontend Framework** | React | `v19.2.8` | Reactive component-driven user interface |
| **Language (Frontend)** | TypeScript | `v5.x` | Strict type safety across all components and data structures |
| **Bundler & Build Tool**| Vite | `v8.2.2` | Rapid local HMR development and optimized production bundling |
| **Styling & Design** | Tailwind CSS & PostCSS | `v4.3.3` | Modern glassmorphism, responsive tactical dark/light mode, and animations |
| **Iconography** | Lucide React | `v1.41.0` | Comprehensive disaster, weather, and sensor iconography |
| **Geospatial Mapping** | Leaflet & @types/leaflet | `v1.9.4` | Interactive 2D/3D map canvas, GeoJSON multi-polygons, and markers |
| **Data Analytics Charts**| Recharts | `v3.10.1` | Real-time telemetry graphs, correlation charts, and trend analysis |
| **Mobile Runtime** | Capacitor (Android, Core, CLI) | `v8.5.1 / v6.x` | Native Android wrapper bridging web code with native Android device hardware |
| **Native Plugins** | Geolocation, Camera, Network, Preferences | `Capacitor 8.x` | High-accuracy GPS, camera photo captures, network status, offline storage |
| **Backend Framework** | FastAPI | `v0.110.0+` | High-throughput async REST API & WebSocket server |
| **ASGI Web Server** | Uvicorn | `v0.28.0+` | High-performance asynchronous Python web server |
| **Data Validation** | Pydantic & Pydantic-Settings | `v2.6.0+` | Strict schema validation and configuration management |
| **ORM & Database** | SQLAlchemy 2.0 & SQLite / PostgreSQL | `v2.0.0+` | Persistent storage with clean repository abstractions |
| **Machine Learning** | Scikit-Learn, NumPy, Pandas, Joblib | `v1.4.0+` | Random Forest hazard classification & data preprocessing |
| **Embedded Firmware** | Arduino C++ (ESP32) | `ESP32 Core` | Physical edge sensor data collection (Rain, Soil, MPU6050, DHT22) |
| **IoT Telemetry Daemon** | Python Requests / WebSockets | `Python 3.10+` | Continuous multi-station background telemetry generator |
| **Android Tooling** | Android SDK 36 (Java 21 OpenJDK) & Gradle | `Gradle 8.x` | Native Android APK compilation and signing |
| **Containerization** | Docker & Docker Compose | `Multi-stage` | Production deployment with Nginx frontend and Uvicorn backend |

---

## 3. End-to-End Architecture

```
                               ┌───────────────────────────────────────────────┐
                               │       PHYSICAL & SIMULATED IoT SENSORS        │
                               │  - Tipping Bucket Rain Gauge (mm/hr)          │
                               │  - Capacitive Soil Moisture (% Saturation)    │
                               │  - MPU6050 Inclinometer & Gyro (Tilt °)       │
                               │  - Piezoelectric Vibration Sensor (g-force)   │
                               │  - Vibrating Wire Piezometer (kPa)            │
                               └──────────────────────┬────────────────────────┘
                                                      │
                                                      ▼  HTTP REST / WebSocket Telemetry
                               ┌───────────────────────────────────────────────┐
                               │           FASTAPI BACKEND & DATA BUS          │
                               │  - Telemetry Ingestion & Anomaly Validation   │
                               │  - State & Geotechnical Parameter Extraction  │
                               │  - WebSocket Telemetry Broadcast              │
                               └──────────────────────┬────────────────────────┘
                                                      │
                                                      ▼
                               ┌───────────────────────────────────────────────┐
                               │       AI / ML LANDSLIDE RISK ENGINE           │
                               │  - Random Forest Classifier Probability       │
                               │  - Geotechnical Formula Hazard Weighting      │
                               │  - Continuous Hazard Score (0 - 100)          │
                               │  - Hazard Level: LOW / MODERATE / HIGH / CRIT │
                               └──────────────────────┬────────────────────────┘
                                                      │
                                                      ▼
                      ┌───────────────────────────────┴───────────────────────────────┐
                      │                                                               │
                      ▼                                                               ▼
        ┌───────────────────────────┐                                   ┌───────────────────────────┐
        │  EARLY WARNING ALERT SVC  │                                   │   INTERACTIVE WEB & APK   │
        │ - Threshold Trigger Rules │                                   │ - Leaflet GIS 22 NER Zones│
        │ - Cooldown Logic          │                                   │ - Real-Time Dashboard     │
        │ - Automated Authority SMS │                                   │ - Analytics & Recharts    │
        └─────────────┬─────────────┘                                   └─────────────┬─────────────┘
                      │                                                               │
                      ▼                                                               ▼
        ┌───────────────────────────┐                                   ┌───────────────────────────┐
        │  DISASTER RESPONSE TEAMS  │ ◄───────────────────────────────► │  FIELD OFFICER & CITIZEN  │
        │ - SDRF / NDRF Command     │       Bidirectional Sync &        │ - Offline Evidence Capture│
        │ - Road Closure & Evac     │        Incident Reports           │ - GPS Geotagged Photos    │
        └───────────────────────────┘                                   └───────────────────────────┘
```

---

## 4. Comprehensive File & Directory Breakdown

### 📁 Root Directory
- `.env.example` — Environment variable template for API keys, DB URL, and server ports.
- `README.md` — Project summary, quickstart instructions, and hackathon presentation guidelines.
- `PROJECT_OVERVIEW.md` — Complete master technical documentation (this file).
- `ANDROID_BUILD_REPORT.md` — Android build verification matrix and APK signing report.
- `AVERTIS_Latest_SIH26001.apk` — Compiled, standalone debug APK for Android testing.
- `build_apk.bat` / `build_apk.ps1` — Automated 1-click batch/PowerShell scripts to compile Vite bundle, sync Capacitor, and build Android APK.
- `open_android_studio.bat` — Launches the native Android project in Android Studio.
- `start_avertis.bat` — 1-click script launching Backend, Frontend, and IoT Simulator concurrently.
- `docker-compose.yml` — Multi-container Docker orchestration file for backend and frontend.

---

### 📁 Backend Layer (`backend/`)
- `requirements.txt` — Python dependencies (FastAPI, Uvicorn, Scikit-Learn, SQLAlchemy, Pandas, etc.).
- `Dockerfile` — Production container definition for FastAPI service.
- `avertis.db` — SQLite database storing zones, sensor readings, alerts, and incident reports.
- `verify_system.py` — Automated verification script checking DB integrity, ML inferences, and endpoints.
- **`app/main.py`** — FastAPI entrypoint with CORS, WebSocket endpoints (`/ws/telemetry`, `/ws/alerts`), and routers.
- **`app/config.py`** — Application configuration and environment variable parsing.
- **`app/database.py`** — SQLAlchemy DB engine, session maker, and dependency injector.
- **`app/models.py`** — Database models (`Zone`, `SensorNode`, `SensorReading`, `Alert`, `IncidentReport`, `User`).
- **`app/schemas.py`** — Pydantic DTO validation models for requests and responses.
- **`app/seed_data.py`** — Initial data seeding covering all 22 NER sectors with real-world topography coordinates.
- **`app/api/`**:
  - `zones.py` — REST endpoints for querying monitoring zones and GeoJSON hazard layers.
  - `sensors.py` — Telemetry ingest endpoints and sensor node status feeds.
  - `alerts.py` — Early warning query, generation, and acknowledgment routes.
  - `incidents.py` — Citizen and field officer incident submission endpoints.
  - `prediction.py` — Direct ML inference API for hazard calculation.
  - `simulation.py` — Scenario trigger API (*Heavy Rain*, *Extreme Rain*, *Tilt Drift*, *Reset*).
  - `reports.py` — CSV/PDF analytical risk report generation.
  - `auth.py` — User authentication, JWT tokens, and RBAC role validation.
  - `dashboard.py` — Aggregated KPI metrics, active alert count, and state health statistics.
- **`app/services/`**:
  - `alert_service.py` — Automated threshold rules engine with cooldown controls.
  - `sensor_service.py` — Ingest processing and statistical aggregation.
  - `simulation_service.py` — State injection service for live hackathon scenario demos.
  - `sms_service.py` — Emergency SMS broadcast notification dispatcher.
- **`app/ml/`**:
  - `train.py` — Synthetic dataset generator and Random Forest Classifier trainer.
  - `predict.py` — Hazard score calculation combining ML probabilities with geotechnical mechanics.
  - `model.pkl` / `model_meta.pkl` — Trained Random Forest weights and metadata.

---

### 📁 Frontend Layer (`frontend/`)
- `package.json` — Node.js dependencies (React 19, Vite, Leaflet, Tailwind CSS v4, Capacitor plugins).
- `vite.config.ts` — Vite build configuration and server proxy setup.
- `capacitor.config.ts` — Native Capacitor configuration pointing to `dist` web build.
- `tailwind.config.js` / `postcss.config.js` — Tailwind CSS styling engine.
- `index.html` — HTML5 single-page application entrypoint.
- **`src/index.css`** — Core design system: Tailwind v4 imports, Leaflet popup overrides, glassmorphism utilities, glow effects, and custom animations.
- **`src/App.tsx`** — Master container component managing navigation, active tabs, WebSocket connections, and role-based views.
- **`src/components/`**:
  - `GISMap.tsx` — Full-featured Leaflet GIS map with 22 polygon sectors, custom markers, and multi-basemap switcher.
  - `FieldOfficerMode.tsx` — Mobile operational mode with GPS geotagging, on-device camera evidence capture, and offline queue.
  - `CitizenReportingView.tsx` — Public portal for community incident reporting with image attachments.
  - `AlertsView.tsx` — Active alert feed, severity classification, and acknowledgment dashboard.
  - `SensorsView.tsx` — Real-time sensor grid with battery levels, RSSI, and multi-parameter gauges.
  - `AnalyticsView.tsx` — Recharts graphs for precipitation vs risk score, ground tilt drift, and regional comparisons.
  - `SimulationToolbar.tsx` — Floating demo panel for triggering live weather and sensor scenarios.
  - `MonitoringZonesView.tsx` — Tabular & card directory of all 22 monitored NER zones.
  - `ZoneDetailPanel.tsx` — Slide-out drawer with telemetry breakdown and hazard factor decomposition.
  - `EventTimeline.tsx` — Chronological audit trail of hazard level transitions and system triggers.
  - `MetricsCards.tsx` — High-level KPI summary cards (High Risk Zones, Active Sensors, Pending Alerts).
  - `Navbar.tsx` — Main header with role switcher, search trigger, theme toggle, and notification bell.
  - `LoginModal.tsx` — RBAC modal for Admin, Field Officer, and Public citizen logins.
  - `GlobalSearchModal.tsx` — Fast search modal across zones, sensors, alerts, and reports.
  - `QuickTourModal.tsx` — Guided product onboarding tour for first-time evaluators.
  - `SystemHealthView.tsx` — Live API ping, database status, ML inference latency, and node uptimes.
  - `ReferencesView.tsx` — Institutional and scientific references (GSI, NESAC, ISRO, NDMA, IMD).
  - `LandingPage.tsx` — Overview landing presentation view.
- **`src/services/api.ts`** — Unified Axios/Fetch API client with offline storage queue, network listeners, and fallback mock data.
- **`src/types/index.ts`** — TypeScript interfaces for Zones, Sensors, Readings, Alerts, and Incidents.

---

### 📁 IoT & Embedded Layer (`iot/`)
- **`iot/simulator/sensor_daemon.py`** — Python daemon streaming realistic multi-sensor telemetry packets to the backend every 3 seconds.
- **`iot/esp32/avertis_node.ino`** — Arduino C++ firmware for physical ESP32 hardware reading:
  - Rain Gauge (Digital Interrupt pulse count)
  - Capacitive Soil Moisture Sensor (Analog ADC)
  - MPU6050 Accelerometer / Gyroscope (I2C Tilt angle)
  - DHT22 Temperature & Humidity (OneWire)
  - WiFi HTTP POST client transmitting JSON telemetry packets.
- **`iot/mqtt/`** — MQTT broker integration and topic configuration.

---

### 📁 Documentation Layer (`docs/`)
- `architecture.md` — Detailed system architecture, data pipelines, and security model.
- `api.md` — REST API endpoint documentation and request/response payloads.
- `ml.md` — Machine learning model training methodology, feature weights, and evaluation metrics.
- `iot.md` — Hardware wiring diagrams, pinouts, and sensor calibration standards.
- `android.md` — Native Capacitor Android packaging and camera/GPS permission guide.
- `demo.md` — Step-by-step evaluation walkthrough for Hackathon judges.

---

## 5. AI / Machine Learning Model Pipeline

### Feature Set:
1. **Cumulative Rainfall 24h & 72h ($mm$):** Key driver of topsoil saturation and pore-water pressure.
2. **Soil Moisture Saturation ($\%$):** Measured by capacitive sensors in the sub-surface layer.
3. **Slope Angle ($\theta$ in degrees):** Extracted from Digital Elevation Models (DEM).
4. **MPU6050 Ground Tilt Angle ($^\circ$):** Measures physical sub-surface shear deformation.
5. **Vibration Intensity ($g$):** Piezoelectric sensor detecting micro-seismic tremors or rock fractures.
6. **Pore-Water Pressure ($kPa$):** Vibrating-wire piezometer reading hydrostatic pressure buildup.

### Hazard Formulation:
$$\text{Hazard Score} = w_1 \cdot P_{\text{ML}}(\text{Slide}) + w_2 \cdot \left(\frac{\text{Rain}_{24\text{h}}}{\text{Threshold}}\right) + w_3 \cdot \left(\frac{\text{SoilSat}}{100}\right) + w_4 \cdot \left(\frac{\text{Tilt}}{5^\circ}\right)$$
- **0 – 29:** `LOW` (Normal Monitoring)
- **30 – 59:** `MODERATE` (Advisory State)
- **60 – 79:** `HIGH` (Watch & Warning Issued)
- **80 – 100:** `CRITICAL` (Immediate Evacuation & Highway Closure)

---

## 6. Android Mobile Application & APK Build

The application is fully configured as a native Android project using **Capacitor 8.x**:
- **Package ID:** `in.gov.avertis.disaster`
- **Target SDK:** Android 36 (Java 21 OpenJDK, Gradle 8.x)
- **Compiled Output:** `AVERTIS_Latest_SIH26001.apk` (8.90 MB)
- **Native Permissions:**
  - `ACCESS_FINE_LOCATION` & `ACCESS_COARSE_LOCATION` (GPS Geotagging)
  - `CAMERA` & `READ_MEDIA_IMAGES` (Field Evidence Capture)
  - `ACCESS_NETWORK_STATE` (Live Connection State & Auto-Sync)
- **Offline Storage:** IndexedDB / Capacitor Preferences queue storing pending incident reports when offline and auto-syncing upon reconnection.

---

## 7. Demonstration Scenarios for Evaluators

The built-in **Simulation Toolbar** enables live interactive testing:

| Scenario | Injected Conditions | System Reaction |
|---|---|---|
| **Heavy Rainfall** | Precipitation $168\text{ mm}$, Soil Saturation $88\%$ | Cherrapunji and Gangtok zones escalate to **HIGH / CRITICAL**; automated alerts pop up. |
| **Extreme Rainfall** | Rainfall $225\text{ mm}$ across multiple NER corridors | Multiple regional zones turn **CRITICAL**; emergency SMS simulation activates. |
| **Ground Movement** | Tilt rises to $4.25^\circ$, Vibration surges to $0.68\text{ g}$ | Demonstrates IoT strain detection before rain occurs; triggers immediate warning. |
| **Sensor Outage** | Station node state drops to `OFFLINE` | System detects outage, flags node fault, and switches to fallback imputation. |
| **Reset System** | Restores baseline sensor parameters | Returns all 22 zones and alerts to baseline operational state. |

---

## 8. How to Run & Reproduce

### 1. One-Click Launch (Recommended)
Double-click [`start_avertis.bat`](file:///c:/Users/admin/Desktop/SIH%202026/Prototype/start_avertis.bat) in the project root. This launches:
- Backend Server on `http://127.0.0.1:8000`
- Frontend Dashboard on `http://localhost:5173`
- IoT Telemetry Daemon in the background

### 2. Manual Commands
```bash
# Terminal 1 - Backend
cd backend
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload

# Terminal 2 - Frontend
cd frontend
npm install
npm run dev

# Terminal 3 - (Optional) IoT Simulator
cd iot/simulator
python sensor_daemon.py
```

### 3. Rebuild Native Android APK
```cmd
build_apk.bat
```
*(Compiled APK will be generated at `frontend/android/app/build/outputs/apk/debug/app-debug.apk` and copied to `AVERTIS_Latest_SIH26001.apk`)*.
