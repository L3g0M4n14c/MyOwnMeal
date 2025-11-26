# 🚀 Getting Started - MyOwnMeal

Quick-Start Guide für Entwickler und Nutzer.

## ⚡ 5-Minuten Setup

### 1. Installation

```bash
cd MyOwnMeal/myownmeal_app

# Dependencies herunterladen
flutter pub get

# Code generieren
flutter pub run build_runner build --delete-conflicting-outputs

# App starten
flutter run
```

### 2. Erste Schritte in der App

1. **Home Screen** öffnet sich
2. Klick **"Rezept hinzufügen"**
3. Wähle eine Methode:
   - **Von URL:** Gib `https://www.chefkoch.de/rezepte/...` ein
   - **Manuell:** Name + Beschreibung eingeben
4. Rezept wird gespeichert ✓

## 📱 App Navigation

```
Home Screen
├─ "Rezept hinzufügen" → AddRecipeScreen
│  ├─ Tab "Von URL" → RecipeScraperService
│  └─ Tab "Manuell" → Create Recipe
├─ "Wochenplan erstellen" → MealPlanScreen
│  ├─ Tab "Plan erstellen" → LLMService
│  └─ Tab "Einkaufsliste" → Shopping List
└─ ⚙️ Settings → PreferencesScreen
   └─ Ernährungspräferenzen + Kochzeit
```

## 🎯 Main Features Demo

### Feature 1: Rezept auslesen

```
URL eingeben:
  ↓
App parsed JSON-LD/HTML
  ↓
Rezept gespeichert
  ↓
Angezeigt in "Deine Rezepte"
```

**TestURLs zum Ausprobieren:**
- https://www.chefkoch.de/rezepte/
- https://eatsmarter.de/rezepte/
- Beliebige Rezept-Website

### Feature 2: Wochenplan generieren

```
Klick "Wochenplan erstellen"
  ↓
App wählt 3 Rezepte basierend auf:
  - Deine Vorlieben (vegan, vegetarisch, etc.)
  - Max. Kochzeit (Standard: 120 Min)
  ↓
Zeigt koordinierten Kochplan
  ↓
Generiert automatisch Einkaufsliste
```

### Feature 3: Einstellungen

```
Klick ⚙️ oben rechts
  ↓
Wähle Diäten (Multi-Select):
  ☑ vegan
  ☑ proteinreich
  ☐ lowcarb
  ↓
Stelle ein:
  - Anzahl Gerichte (1-7)
  - Max. Kochzeit (60-180 Min)
  ↓
Speichern → Wirkt auf Wochenpläne
```

## 🏗️ Projekt-Struktur Quick Guide

```
lib/
├── main.dart ← App Start hier
├── models/ ← Datenstrukturen
│   ├── recipe.dart
│   ├── user_preferences.dart
│   ├── meal_plan.dart
│   └── shopping_list.dart
├── services/ ← Business Logic
│   ├── recipe_scraper_service.dart (Web-Scraping)
│   ├── llm_service.dart (Koordination)
│   └── local_storage_service.dart (Speicherung)
├── providers/ ← State Management
│   ├── recipe_provider.dart
│   ├── preferences_provider.dart
│   └── meal_plan_provider.dart
└── screens/ ← UI
    ├── home/
    ├── preferences/
    ├── recipes/
    └── meal_plan/
```

## 🛠️ Development Commands

```bash
# Analyse & Fehlerprüfung
flutter analyze

# Code formatieren
dart format .

# Code generieren (Freezed, JSON)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch Mode (Auto-Update bei Änderungen)
flutter pub run build_runner watch

# Projekt starten
flutter run

# Release Build
flutter run --release

# Tests
flutter test
```

## 🐛 Häufige Probleme

### Problem: "Target of URI doesn't exist"
```
Lösung: Code generieren ausführen
flutter pub run build_runner build --delete-conflicting-outputs
```

### Problem: "Failed to load data"
```
Lösung 1: App neu starten
  flutter run

Lösung 2: Projekt cleanen
  flutter clean
  flutter pub get
  flutter pub run build_runner build
```

### Problem: Rezept-URL wird nicht geparst
```
Lösung: Website unterstützt evtl. nicht Standard-Format
  - Versuche andere Website
  - Oder nutze "Manuell" Modus
```

## 🧪 Testing

### Lokales Testen (ohne echte Rezept-Website)

**Mock-Daten in Providers:**
```dart
// In recipe_provider.dart ergänzen:
Future<void> loadSampleRecipes() async {
  final samples = [
    Recipe(
      id: '1',
      name: 'Test Pasta',
      description: 'Leckere Pasta',
      ingredients: ['Nudeln', 'Tomaten', 'Basilikum'],
      cookingSteps: [...],
      cookTimeMinutes: 30,
      // ...
    ),
  ];
  _recipes = samples;
  notifyListeners();
}
```

Dann in `home_screen.dart`:
```dart
// In initState():
context.read<RecipeProvider>().loadSampleRecipes();
```

### Automatisierte Tests
```bash
flutter test test/
```

## 📚 Code-Beispiele

### Rezept hinzufügen (Programmatisch)

```dart
// In einem Provider/Screen
final recipe = Recipe(
  id: DateTime.now().millisecondsSinceEpoch.toString(),
  name: 'Mein Rezept',
  description: 'Meine Lieblingsgerichte',
  ingredients: ['Zutat 1', 'Zutat 2'],
  cookingSteps: [
    CookingStep(
      stepNumber: 1,
      description: 'Alles kochen',
      durationMinutes: 30,
      requiredIngredients: ['Zutat 1'],
      equipment: ['Topf'],
    )
  ],
  prepTimeMinutes: 15,
  cookTimeMinutes: 30,
  servings: 4,
  tags: ['vegan'],
  rating: 4.5,
  createdAt: DateTime.now(),
);

await context.read<RecipeProvider>().addRecipe(recipe);
```

### Wochenplan generieren (Programmatisch)

```dart
final mealPlanProvider = context.read<MealPlanProvider>();
final recipeProvider = context.read<RecipeProvider>();
final prefsProvider = context.read<PreferencesProvider>();

await mealPlanProvider.generateWeeklyMealPlan(
  recipeProvider.recipes,
  prefsProvider.getActiveTagsForWeek(),
  3, // Anzahl Gerichte
  120, // Max Kochzeit
);
```

### State Zugriff (Im Screen)

```dart
// Consumer Pattern
Consumer<RecipeProvider>(
  builder: (context, recipeProvider, child) {
    if (recipeProvider.isLoading) {
      return CircularProgressIndicator();
    }
    
    return ListView(
      children: recipeProvider.recipes.map((recipe) {
        return ListTile(title: Text(recipe.name));
      }).toList(),
    );
  }
)

// Oder: read() für one-time Access
final recipes = context.read<RecipeProvider>().recipes;
```

## 🔐 Environment Variables

Für LLM-API Keys später:

**Erstelle `.env` Datei:**
```
OPENAI_API_KEY=sk-...
GOOGLE_API_KEY=...
```

**In Code laden:**
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

// Verwendung:
final apiKey = dotenv.env['OPENAI_API_KEY'];
```

## 📖 Nützliche Links

- [Flutter Docs](https://flutter.dev/docs)
- [Provider Package](https://pub.dev/packages/provider)
- [Freezed Package](https://pub.dev/packages/freezed)
- [Hive DB](https://pub.dev/packages/hive)
- [Schema.org Recipe](https://schema.org/Recipe)

## 🎓 Nächste Schritte

### Anfänger:
1. ✓ App starten
2. ✓ Rezepte hinzufügen
3. Wochenplan testen
4. Mit eigenen Rezepten experimentieren

### Fortgeschrittene:
1. LLM-API integrieren
2. Cloud-Sync hinzufügen
3. Unit Tests schreiben
4. Performance optimieren

### Contributors:
1. Fork repo
2. Feature Branch erstellen
3. Code schreiben
4. Tests schreiben
5. Pull Request

## 🤔 FAQ

**F: Funktioniert die App offline?**
A: Ja! Alle Rezepte/Pläne sind lokal gespeichert. URLs können nur mit Internetverbindung gescraped werden.

**F: Wie füge ich LLM ein?**
A: Siehe `ARCHITECTURE.md` - LLMService hat Placeholder für APIs.

**F: Kann ich meine Daten exportieren?**
A: Noch nicht im MVP. Geplant für v2 (JSON Export).

**F: Welche Android/iOS Versionen?**
A: Android 5.0+, iOS 11.0+

**F: Ist die App kostenlos?**
A: Ja, privates Projekt.

## 📞 Hilfe

Bei Fragen:
1. Schau in `README.md` oder `ARCHITECTURE.md`
2. Öffne ein GitHub Issue
3. Kontakt: [Your Email]

---

**Status:** MVP ✅
**Version:** 1.0.0
**Happy Cooking! 🍽️**
