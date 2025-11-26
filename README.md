# MyOwnMeal 🍳

Eine intelligente Flutter-App zur Meal-Prep-Planung mit automatischer Rezeptauslesen, wochenweisem Meal-Planning und optimierter paralleler Kochkoordinierung.

## 🎯 Überblick

MyOwnMeal hilft dir:
- ✅ Rezepte von Websites oder manuell hinzufügen
- ✅ Deine Ernährungspräferenzen (vegan, vegetarisch, proteinreich, lowcarb, etc.) definieren
- ✅ Intelligente Wochenplan-Vorschläge erhalten
- ✅ Gerichte parallel kochen (koordinierte Kochschritte)
- ✅ Automatische Einkaufslisten generieren

## 🏗️ Architektur

### Projektstruktur

```
MyOwnMeal/
├── README.md
└── myownmeal_app/           # Flutter-Projekt
    ├── lib/
    │   ├── main.dart                    # Entry Point
    │   ├── models/                      # Datenmodelle (Freezed)
    │   │   ├── recipe.dart
    │   │   ├── user_preferences.dart
    │   │   ├── meal_plan.dart
    │   │   └── shopping_list.dart
    │   ├── services/                    # Business Logic
    │   │   ├── recipe_scraper_service.dart    # Web-Scraping
    │   │   ├── llm_service.dart              # LLM-Integration (Placeholder)
    │   │   └── local_storage_service.dart    # Hive Storage
    │   ├── providers/                   # State Management (Provider)
    │   │   ├── recipe_provider.dart
    │   │   ├── preferences_provider.dart
    │   │   └── meal_plan_provider.dart
    │   └── screens/                     # UI
    │       ├── home/
    │       ├── preferences/
    │       ├── recipes/
    │       └── meal_plan/
    ├── pubspec.yaml
    └── test/
```

### Technologie-Stack

| Layer | Technologie | Zweck |
|-------|-------------|-------|
| **UI** | Flutter | Cross-Platform (iOS/Android) |
| **State** | Provider | State Management |
| **Storage** | Hive | Lokale Datenspeicherung |
| **Scraping** | html + http | Rezept-Auslesen |
| **Serialization** | Freezed + json_serializable | Type-Safe Modelle |
| **API** | LLMService (Placeholder) | Intelligente Koordination |

## 🚀 Features

### ✅ MVP (Implementiert)

#### 1. Rezept-Management
- **URL-basiert:** Rezepte von Websites auslesen
  - JSON-LD Parsing (Standard für strukturierte Daten)
  - HTML-Fallback für einfache Websites
- **Manuell:** Rezepte selbst erstellen
- **Speicherung:** Lokal mit Hive

#### 2. Benutzereinstellungen
- Standard-Ernährungspräferenzen speichern
- Wöchentliche Anpassung ohne Default-Änderung
- Anzahl Gerichte (1-7) und Kochzeit (60-180 Min) konfigurieren

#### 3. Wochenplan-Generierung
- Rezepte nach Tags filtern
- Intelligente Auswahl basierend auf Kochzeit
- Koordinierte Kochplanung für Parallelisierung

#### 4. Einkaufsliste
- Automatisches Aggregieren von Zutaten
- Kategorisierung
- Check-off Funktion

### 🔜 Geplante Features

- [ ] **LLM-Integration** (z.B. OpenAI, Claude)
  - Intelligentere Koordination von Kochschritten
  - Vision API für Rezept-Fotos
  
- [ ] **Erweiterte Verwaltung**
  - Favoriten/Ratings
  - Rezept-Suche
  - Benutzer-Authentifizierung
  
- [ ] **UX Verbesserungen**
  - Dark Mode
  - Rezept-Bilder
  - Allergie-Tracking

## 📱 Installation

### Voraussetzungen
```
✓ Flutter 3.9.2+
✓ Dart 3.9.2+
✓ iOS 11.0+ oder Android 5.0+
```

### Setup

```bash
cd MyOwnMeal/myownmeal_app

# 1. Dependencies installieren
flutter pub get

# 2. Code-Generierung
flutter pub run build_runner build --delete-conflicting-outputs

# 3. App starten
flutter run

# Release Build
flutter run --release
```

## 📖 Verwendung

### Workflow 1: Rezept von Website hinzufügen

1. Gehe zu "Rezept hinzufügen" > "Von URL"
2. Gib eine Rezept-URL ein (z.B. von Chefkoch, EatSmarter)
3. App liest automatisch aus:
   - Name, Beschreibung
   - Zutaten
   - Kochschritte
   - Zeiten
4. Rezept wird gespeichert

Unterstützte Websites:
- Websites mit JSON-LD strukturierten Daten
- Klassische HTML-basierte Rezeptsites
- Beliebige URLs mit Rezept-Informationen

### Workflow 2: Einstellungen konfigurieren

1. Klick auf ⚙️ (oben rechts auf Home)
2. Wähle Ernährungspräferenzen (Multi-Select)
   - vegan, vegetarisch, proteinreich, lowcarb, etc.
3. Stelle Standard-Anzahl Gerichte ein (1-7)
4. Wähle maximale Kochzeit (60/90/120/150/180 Min)
5. Speichern → wirkt sich auf zukünftige Wochenpläne aus

### Workflow 3: Wochenplan erstellen

1. Klick "Wochenplan erstellen" auf Home
2. (Optional) Einstellungen für **diese Woche** anpassen
   - Ändert nicht Ihre Standard-Einstellungen
3. Klick "Wochenplan generieren"
4. App zeigt:
   - **3 ausgewählte Rezepte** (oder: konfigurierte Anzahl)
   - **Koordinierter Kochplan** mit Zeitslots
   - **Tipps** für effizientes paralleles Kochen

### Workflow 4: Einkaufsliste

1. Wechsle zum Tab "Einkaufsliste"
2. Alle Zutaten der Wochenplan-Rezepte sind aggregiert
3. Häkchen setzen während du einkaufst
4. Kategorisierte Ansicht für bessere Organisation

## 🔧 Entwicklung

### Code Generation (Freezed & JSON)
```bash
# Einmal
flutter pub run build_runner build --delete-conflicting-outputs

# Watch Mode (Auto-Update)
flutter pub run build_runner watch
```

### Linting & Format
```bash
flutter analyze  # Fehler prüfen
dart format .    # Code formatieren
```

### Tests
```bash
flutter test
```

## 📐 Datenmodelle

### Recipe
```dart
Recipe(
  id: String,
  name: String,
  description: String,
  ingredients: List<String>,
  cookingSteps: List<CookingStep>,
  prepTimeMinutes: int,
  cookTimeMinutes: int,
  servings: int,
  tags: List<String>,      // vegan, vegetarisch, etc.
  rating: double,
  sourceUrl: String?,
  createdAt: DateTime?,
)

CookingStep(
  stepNumber: int,
  description: String,
  durationMinutes: int,
  requiredIngredients: List<String>,
  equipment: List<String>,  // Topf, Pfanne, Ofen, etc.
)
```

### UserPreferences
```dart
UserPreferences(
  userId: String,
  defaultTags: List<String>,
  defaultRecipesPerWeek: int,       // 1-7
  defaultCookingTimeMinutes: int,   // 60-180
  allowRepeatRecipes: bool,
  createdAt: DateTime?,
  updatedAt: DateTime?,
)

// Für diese Woche
WeeklyPreferences(
  weekIdentifier: String,           // "2025-W48"
  tags: List<String>,
  recipesPerWeek: int,
  cookingTimeMinutes: int,
  createdAt: DateTime?,
)
```

### MealPlan
```dart
MealPlan(
  id: String,
  weekIdentifier: String,
  meals: List<PlannedMeal>,         // Rezepte + Tag + MealType
  coordinatedPlans: List<CoordinatedCookingPlan>,
  createdAt: DateTime?,
  updatedAt: DateTime?,
)

CoordinatedCookingPlan(
  id: String,
  recipeIds: List<String>,
  steps: List<CoordinatedStep>,     // Zeitlich optimiert
  totalDurationMinutes: int,
)

// Beispiel koordinierte Schritte:
// - 00:00 - 05:00 Min: Schneiden (alle 3 Rezepte parallel)
// - 05:00 - 20:00 Min: Kochen Rezept 1 + Backen Rezept 2
// - usw.
```

### ShoppingList
```dart
ShoppingList(
  id: String,
  weekIdentifier: String,
  items: List<ShoppingItem>,
  isChecked: bool,
  createdAt: DateTime?,
  updatedAt: DateTime?,
)

ShoppingItem(
  id: String,
  name: String,
  quantity: double,
  unit: String,             // kg, g, ml, Stück, etc.
  category: String,         // Gemüse, Getreide, Protein, etc.
  isChecked: bool,
  notes: String?,
  recipeIds: List<String>,  // Aus welchen Rezepten
)
```

## 🤖 LLM-Integration (Placeholder)

Die App hat Platzhalter für LLM-Integration:

### Aktuelle Mock-Implementierung
- `LLMService` generiert simple koordinierte Pläne
- Sortiert Rezepte nach Kochzeit

### Zukünftige Integration
```dart
// Beispiel: OpenAI Integration
Future<String> coordinateCookingSteps(...) async {
  final response = await openai.createChatCompletion(
    model: 'gpt-4',
    messages: [
      {
        'role': 'system',
        'content': 'Du bist ein Kochexperte der Kochschritte optimiert...',
      },
      {
        'role': 'user',
        'content': 'Koordiniere diese Rezepte: ...',
      }
    ]
  );
  return response.choices[0].message.content;
}
```

Empfohlene LLM-APIs:
- **OpenAI** (GPT-4)
- **Google Gemini**
- **Anthropic Claude**

## 🔒 Datenspeicherung

### Hive (Lokale Datenbank)
- Schnell und effizient für Mobilgeräte
- Verschlüsselung unterstützt
- Keine Internetverbindung nötig

### Speicherte Daten
- Rezepte (Name, Zutaten, Schritte, Tags)
- Benutzereinstellungen (Vorlieben, Standards)
- Wochenpläne und Einkaufslisten

### Keine Cloud-Synchronisierung (MVP)
- Daten existieren nur auf dem Gerät
- Kein Backup/Restore
- Wird in v2 implementiert

## ⚠️ Bekannte Limitationen

| Limitation | Grund | Zukünftige Lösung |
|-----------|-------|-------------------|
| Kein Cloud-Sync | MVP-Phase | Firebase/Supabase |
| LLM ist Mock | Keine API-Keys | Konfigurierbare APIs |
| Begrenzte Scraper | HTML varies | Bessere Parser |
| Keine Auth | Fokus auf Features | Firebase Auth |
| Lokale Bilder nur | Speicher | Cloud-Bilder |

## 🧪 Testing

```bash
# Unit Tests
flutter test

# Widget Tests
flutter test test/screens

# Integration Tests
flutter test integration_test/
```

## 📚 API-Referenz

### RecipeScraperService
```dart
Future<Recipe?> scrapeRecipeFromUrl(String url)
// Versucht automatisch: JSON-LD → HTML-Meta → Basic HTML
```

### LLMService
```dart
Future<String> coordinateCookingSteps(List<Recipe> recipes, int maxTime)
// Koordiniert Kochschritte für paralleles Kochen

Future<List<Recipe>> suggestRecipes(
  List<Recipe> available,
  List<String> tags,
  int count,
  int maxTime
)
// Filtert und schlägt Rezepte vor
```

### LocalStorageService
```dart
Future<void> init()                           // Initialisieren
Future<void> saveRecipe(Recipe recipe)
Recipe? getRecipe(String id)
List<Recipe> getAllRecipes()
List<Recipe> getRecipesByTags(List<String> tags)
// ... ähnlich für Preferences, MealPlans, ShoppingLists
```

## 🤝 Beitragen

Ideen für Verbesserungen:
1. Fork des Repos
2. Feature Branch (`git checkout -b feature/my-feature`)
3. Änderungen committen
4. Push + Pull Request

## 📞 Support

Fragen oder Probleme?
- Öffne ein GitHub Issue
- Kontaktiere: [Your Email]

## 📄 Lizenz

Private Use - Alle Rechte vorbehalten

---

**Status:** ✅ MVP (Minimum Viable Product)
**Version:** 1.0.0
**Letzte Aktualisierung:** November 2025

Viel Spaß beim effizienten Kochen! 🍽️
