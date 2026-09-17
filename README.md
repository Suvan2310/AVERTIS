# AVERTIS — AI-Based Early Warning & Landslide Risk Monitoring System in NER

**Tagline:** *Avert Risk Before It Becomes a Disaster*  
**Smart India Hackathon 2026 | Problem Statement ID:** `SIH26001`  
**Theme:** Disaster Management (North Eastern Region of India)  
**Category:** Software / Geotechnical AI / IoT  
**Team:** NEXORA  

---

## 🌟 Executive Summary

**AVERTIS** is a full-stack, closed-loop landslide risk monitoring and early-warning decision-support system designed specifically for the complex topography and high-intensity monsoon dynamics of the **North Eastern Region (NER) of India** (covering Meghalaya, Sikkim, Assam, Mizoram, Nagaland, Manipur, Tripura, and Arunachal Pradesh).

The platform continuously integrates **IoT geotechnical sensor telemetry (Soil Moisture, Rain Gauges, MPU6050 Inclinometers, Piezo Vibration)**, meteorological precipitation data, topographical digital elevation models, and satellite indicators into an **AI Risk Engine (Random Forest Hazard Classifier)** to provide real-time hazard estimation ($0-100$), automated early-warning alerts, mobile-first offline field officer tooling, and public citizen crowdsourcing.

```
          ENVIRONMENTAL & IoT SENSORS (ESP32)
                          │
                          ▼
            DATA INGESTION & VALIDATION
                          │
                          ▼
             AI/ML LANDSLIDE RISK ENGINE
                          │
                          ▼
       ┌──────────────────┴──────────────────┐
       │                                     │
       ▼                                     ▼
INTERACTIVE GIS MAP               EARLY WARNING ALERTS
(22 NER Zones, Sensors)           (Thresholds, Cooldown)
       │                                     │
       └──────────────────┬──────────────────┘
                          │
                          ▼
      AUTHORITY ACTIONS & FIELD / CITIZEN FEEDBACK
  (Offline PWA, GPS Pinning, Incident Verification)
                          │
                          ▼
            UPDATED RISK INTELLIGENCE LOOP
```

---

## 🏗️ Technology Stack

| Layer | Technologies Used |
|---|---|
| **Frontend** | React 18, TypeScript, Vite, Tailwind CSS v4, Lucide Icons, Recharts |
| **GIS Mapping** | Leaflet with multi-basemap switcher (Esri Dark Tactical, High-Res Satellite 3D, Topographic Relief, OpenStreetMap), GeoJSON multi-polygons |
| **Backend** | Python 3.14, FastAPI, Pydantic v2, SQLAlchemy, Uvicorn, WebSockets / SSE |
| **Database** | SQLite (development) with clean repository abstraction ready for PostgreSQL / PostGIS |
| **AI / ML** | Scikit-Learn (Random Forest Classifier), NumPy, Pandas, Joblib |
| **IoT Edge** | ESP32 C++ firmware sketch (`.ino`), REST Telemetry API, MQTT bridge abstraction |

---

## 🚀 Quickstart Guide

### Prerequisites
- Python 3.10+
- Node.js 18+ & npm 9+

### 1. Start the Backend API & ML Engine
```bash
cd backend
python -m pip install fastapi uvicorn pydantic scikit-learn numpy pandas joblib sqlalchemy python-multipart websockets
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```
*Backend runs on `http://127.0.0.1:8000` (Interactive Swagger Docs: `http://127.0.0.1:8000/docs`).*

### 2. Start the Frontend React Dashboard
```bash
cd frontend
npm install
npm run dev
```
*Frontend runs on `http://localhost:5173`.*

---

## 🧪 Interactive SIH Demonstration Scenarios

AVERTIS includes a live **Simulation Toolbar** on the dashboard for judges:

| Scenario Button | Simulated Action | AI & System Response |
|---|---|---|
| **[Heavy Rainfall]** | Precipitation spikes to $168\text{ mm}$, soil saturation rises to $88\%$. | AI recalculates hazard score; vulnerable hill zones (e.g. Cherrapunji, Gangtok) turn **CRITICAL / HIGH**; early-warning alerts trigger. |
| **[Extreme Rainfall]** | Torrential monsoon surge ($225\text{ mm}$) across multiple NER corridors. | Widespread elevation of multiple zones to **CRITICAL**; live event timeline records timestamps. |
| **[Ground Tilt / Vibration]** | MPU6050 tilt rises to $4.25^\circ$, vibration surges to $0.68\text{ g}$. | Proves value of IoT strain sensing beyond rainfall alone; alerts broadcast immediately. |
| **[Sensor Outage]** | Drops an active sensor node to `OFFLINE`. | System flags node failure; AI gracefully switches to imputation fallback without crashing. |
| **[Reset Simulation]** | Restores baseline parameters. | Returns all zones, sensors, and alerts to standard baseline monitoring state. |

---

## 🗺️ Monitored Regional Reference Hubs (8 NER States)

1. **Meghalaya**: Shillong Peak, Cherrapunji-Mawsynram Escarpment, Nongstoin
2. **Sikkim**: Gangtok-Tathangchen Urban Slope, Dikchu-Mangan Highway (NH-310A), Namchi
3. **Assam**: Guwahati Kamakhya Hills, Haflong-Jatinga Mountain Highway (NH-54E)
4. **Mizoram**: Aizawl-Laipuitlang Fault Zone, Bawngkawn-Durtlang Scarp, Lunglei
5. **Nagaland**: Kohima-Phesama Bypass Slide (NH-29), Zubza Valley, Mokokchung
6. **Manipur**: Tupul-Noney Railway Incline Sector, Langol Hills, Senapati-Mao Pass
7. **Arunachal Pradesh**: Itanagar-Hollongi Belt, Bhalukpong-Tenga Gorges, Tawang
8. **Tripura**: Jampui Hills Ridge Crest, Agartala-Baramura Cut

---

## 📚 Scientific References & Institutional Attribution

AVERTIS adheres to data standards, susceptibility frameworks, and disaster protocols established by:
- **GSI (Geological Survey of India)** — *National Landslide Forecasting Centre (NLFC) & Bhooskhalan Portal*
- **NESAC (North Eastern Space Applications Centre)** — *Geospatial Disaster Management System*
- **ISRO / NRSC** — *Landslide Atlas of India & Bhuvan Platform*
- **MDoNER** — *Ministry of Development of North Eastern Region*
- **IMD** — *Automatic Weather Station & Precipitation Radar Grids*
- **NDMA** — *National Landslide Risk Management Guidelines*

> **Scientific Prototype Disclaimer:**  
> *This is a prototype decision-support and early-warning concept. Model predictions and demonstration data are not operational forecasts and require validation with authoritative datasets, field observations, domain experts and disaster-management authorities before real-world deployment.*
