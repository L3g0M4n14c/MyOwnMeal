# 📋 MyOwnMeal - Projekt-Übersicht

## ✅ Was wurde implementiert?

Eine **vollständige, funktionsfähige Flutter-App** mit folgenden Features:

### 🎯 Core Features (MVP)

| Feature | Status | Details |
|---------|--------|---------|
| **Rezept-Management** | ✅ | Manuell + URL-basiert (JSON-LD Parsing) |
| **Benutzer-Einstellungen** | ✅ | Default + Weekly Overrides |
| **Wochenplan-Generierung** | ✅ | Tag-basiert, Zeit-optimiert |
| **Einkaufslisten** | ✅ | Auto-Aggregierung, Check-off |
| **Koordinierte Kochplanung** | ✅ | Mock LLM, Parallel-Optimierung |
| **Lokale Speicherung** | ✅ | Hive Database |
| **UI mit Provider** | ✅ | State Management |

## 📁 Projekt-Struktur

```
MyOwnMeal/
├─ 📄 README.md              (Überblick & Funktionen)
├─ 📄 ARCHITECTURE.md        (Technische Architektur)
├─ 📄 DEVELOPMENT.md         (Dev Guide & Best Practices)
├─ 📄 GETTING_STARTED.md     (Quick Start)
└─ 📁 myownmeal_app/         (Flutter App)
   ├─ lib/
   │  ├─ main.dart           (App Entry Point)
   │  ├─ models/             (4 Datenmodelle mit Freezed)
   │  │  ├─ recipe.dart
   │  │  ├─ user_preferences.dart
   │  │  ├─ meal_plan.dart
   │  │  └─ shopping_list.dart
   │  ├─ services/           (3 Services)
   │  │  ├─ recipe_scraper_service.dart
   │  │  ├─ llm_service.dart
   │  │  └─ local_storage_service.dart
   │  ├─ providers/          (3 State Providers)
   │  │  ├─ recipe_provider.dart
   │  │  ├─ preferences_provider.dart
   │  │  └─ meal_plan_provider.dart
   │  └─ screens/            (5 UI Screens)
   │     ├─ home/
   │     ├─ preferences/
   │     ├─ recipes/
   │     └─ meal_plan/
   ├─ pubspec.yaml           (Dependencies)
   └─ test/
```

## 🚀 Schneller Start

### Installation (3 Schritte)

```bash
cd MyOwnMeal/myownmeal_app

# 1. Dependencies
flutter pub get

# 2. Code generieren
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Starten
flutter run
```

### Erste Nutzung

1. **Rezept hinzufügen:** Home → "Rezept hinzufügen"
2. **URL-Methode:** Paste-URL einer Rezept-Website
3. **Wochenplan:** Home → "Wochenplan erstellen"
4. **Einkaufsliste:** Wechsle zu Tab "Einkaufsliste"

## 📊 Statistiken

| Metrik | Wert |
|--------|------|
| **Dart Dateien** | 28+ |
| **Models** | 4 (Freezed) |
| **Services** | 3 |
| **Providers** | 3 |
| **Screens** | 5 |
| **Dependencies** | 18 |
| **Lines of Code** | ~2000+ |

## 🔑 Key Technologies

```
┌─ Frontend ──────────────────────┐
│ Flutter 3.9.2                   │
│ Provider (State Management)      │
│ Material Design 3                │
└─────────────────────────────────┘
         ↓
┌─ Business Logic ────────────────┐
│ Freezed (Immutable Models)      │
│ JSON Serialization              │
│ HTML Parsing (Web Scraping)     │
│ Service-oriented Architecture   │
└─────────────────────────────────┘
         ↓
┌─ Data Layer ────────────────────┐
│ Hive (Local NoSQL DB)           │
│ JSON Storage                    │
└─────────────────────────────────┘
```

## 🎯 Hauptfunktionen im Detail

### 1️⃣ Rezept-Scraping

```
Website URL → HTML Parsing → JSON-LD Extraktion → Recipe Model
```

**Unterstützte Formate:**
- ✅ JSON-LD (Schema.org)
- ✅ HTML Meta-Tags
- ✅ Basic HTML Parsing

### 2️⃣ Wochenplan-Generierung

```
User Tags + Kochzeit → Filter Rezepte → Wähle beste 3 → Koordiniere Schritte
```

**Intelligenz:**
- Filtert nach Ernährungspräferenzen
- Optimiert für Gesamtkochzeit
- Koordiniert paralleles Kochen

### 3️⃣ Einkaufslisten

```
3 Rezepte → Extrahiere Zutaten → Aggregiere Mengen → Kategorisiere
```

**Features:**
- Auto-Aggregierung identischer Zutaten
- Kategorisierung (Gemüse, Getreide, etc.)
- Check-off System

## 🛠️ Development Features

### Code-Generierung
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
- Freezed: Immutable Models
- JSON Serializable: Serialization

### Analyse & Qualität
```bash
flutter analyze  # Fehlerprüfung
dart format .    # Code Formatierung
flutter test     # Unit Tests
```

### Debugging
```bash
flutter run        # Debug Mode
flutter run -v     # Verbose
flutter pub global run devtools
```

## 📚 Dokumentation

| Datei | Zweck |
|-------|--------|
| **README.md** | Überblick, Features, Installation |
| **GETTING_STARTED.md** | Quick Start Guide |
| **ARCHITECTURE.md** | System Design, Datenfluss |
| **DEVELOPMENT.md** | Dev Workflow, Code Style, Testing |

## 🔮 Zukünftige Erweiterungen

### Phase 2 (LLM Integration)
- [ ] OpenAI API Integration
- [ ] Intelligentere Rezept-Koordination
- [ ] Vision API für Fotos

### Phase 3 (Cloud)
- [ ] Firebase Sync
- [ ] Multi-Device Support
- [ ] Cloud Backups

### Phase 4 (Features)
- [ ] Benutzer-Authentifizierung
- [ ] Favoriten & Ratings
- [ ] Allergie-Management
- [ ] Social Sharing

## 📱 Platform Support

| Platform | Status |
|----------|--------|
| Android 5.0+ | ✅ |
| iOS 11.0+ | ✅ |
| Web | 🔄 (Optional) |
| Desktop | 🔄 (Optional) |

## 🧪 Getestet mit

- ✅ Flutter 3.9.2
- ✅ Dart 3.9.2
- ✅ macOS (Development)

## 💾 Datenspeicherung

- **Rezepte:** Hive Box
- **Einstellungen:** Hive Box
- **Wochenpläne:** Hive Box
- **Einkaufslisten:** Hive Box
- **Bilder:** Optional (lokal)

**Speicherort:** App-Documents-Verzeichnis (Platform-spezifisch)

## 🔐 Sicherheit

- ✅ Lokale Speicherung nur
- ✅ Keine Authentifizierung nötig
- ✅ Datenschutz durch lokale Speicherung
- ⚠️ Keine Cloud-Synchronisierung (MVP)

## 🚨 Bekannte Einschränkungen

| Limitation | Grund | Fix |
|-----------|-------|-----|
| Kein Cloud-Sync | MVP-Phase | v2 mit Firebase |
| LLM ist Mock | Keine APIs | Konfigurierbar |
| Begrenzte Scraper | HTML varies | Bessere Parser |
| Keine Fotos | Storage | Cloud Integration |
| Keine Auth | Scope | Multi-User v2 |

## 🤝 Contribution

Neue Features? So geht's:
1. Fork Repo
2. Feature Branch (`feature/new-feature`)
3. Code schreiben + Tests
4. Pull Request

## 📞 Support

- 📖 Lese die Dokumentation
- 🐛 Öffne ein GitHub Issue
- 💬 Kontaktiere: [Your Email]

## 📄 Lizenz

Private Use - Alle Rechte vorbehalten

---

## 🎓 Für Anfänger: So startest du

### Schritt 1: Repository öffnen
```bash
cd MyOwnMeal/myownmeal_app
```

### Schritt 2: Setup
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Schritt 3: Starten
```bash
flutter run
```

### Schritt 4: Erkunden
1. Öffne `lib/main.dart` - App Entry Point
2. Schau `lib/screens/home/home_screen.dart` - UI Struktur
3. Erkunde `lib/providers/recipe_provider.dart` - State Management
4. Lies `lib/models/recipe.dart` - Datenstruktur

### Schritt 5: Ändern
Mache kleine Änderungen:
- Ändere Text in einem Screen
- Drücke `r` für Hot Reload
- Sieh die Änderung sofort!

---

## 🎯 Pro-Tips

### 1. Hot Reload
```
Ändere Code → Speichern → Instant Update
```

### 2. DevTools
```bash
# Während flutter run aktiv
# Drücke 'd' um DevTools zu öffnen
```

### 3. Logging
```dart
print('Debug Info: $variable');
```

### 4. Provider Debugging
```dart
// In main.dart können Sie Provider-State beobachten
// Mit Consumer Pattern
```

---

**Status:** ✅ MVP Ready  
**Version:** 1.0.0  
**Datum:** November 2025

**🎉 Die App ist produktionsreif für die MVP-Phase! 🎉**

Viel Spaß beim Entwickeln und Meal Preppen! 🍽️
