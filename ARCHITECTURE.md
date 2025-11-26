# MyOwnMeal - Architektur-Dokumentation

## System-Übersicht

```
┌─────────────────────────────────────────────────────────────────┐
│                        Flutter App UI                           │
│  ┌──────────────┬──────────────┬──────────────┬──────────────┐  │
│  │ Home Screen  │ Recipe Mgmt  │ Preferences  │ Meal Planner │  │
│  └──────────────┴──────────────┴──────────────┴──────────────┘  │
└────────────────────────┬────────────────────────────────────────┘
                         │
         ┌───────────────┴───────────────┐
         │                               │
    ┌────▼────────────────────────────────▼────┐
    │      Provider State Management            │
    │  ┌──────────────┬──────────────────────┐  │
    │  │ Recipe       │ Preferences          │  │
    │  │ Provider     │ Provider             │  │
    │  ├──────────────┼──────────────────────┤  │
    │  │ MealPlan     │ (Koordination)       │  │
    │  │ Provider     │                      │  │
    │  └──────────────┴──────────────────────┘  │
    └────┬────────────────────────┬─────────────┘
         │                        │
         │                   ┌────▼──────────────────┐
         │                   │   Services Layer      │
         │          ┌────────┼────────────────────┐  │
    ┌────▼────┐     │        │ LLMService         │  │
    │ Hive    │     │   ┌────┼────────────────────┤  │
    │Storage  │     │   │ Recipe Scraper Service │  │
    │         │     │   │ (HTML/JSON-LD Parsing) │  │
    └─────────┘     │   └────────────────────────┘  │
         │          └────────────────────────────────┘
         │                    │
    ┌────▼──────────┐   ┌─────▼──────────────┐
    │ Local Device  │   │ External APIs      │
    │ Storage (Box) │   │ (Optional: OpenAI, │
    └───────────────┘   │  Google Gemini)    │
                        └────────────────────┘
```

## Architektur-Schichten

### 1. Presentation Layer (UI)

**Verzeichnis:** `lib/screens/`

**Komponenten:**
- `home/home_screen.dart` - Hauptbildschirm mit Aktionen
- `preferences/preferences_screen.dart` - Einstellungen konfigurieren
- `recipes/add_recipe_screen.dart` - Rezepte hinzufügen (2 Modi)
- `recipes/recipe_detail_screen.dart` - Rezept-Detailanzeige
- `meal_plan/meal_plan_screen.dart` - Wochenplan + Einkaufsliste

**Merkmale:**
- Material Design 3
- Consumer-Pattern für State-Zugriff
- Error Handling mit SnackBars
- Loading States

### 2. State Management (Business Logic)

**Verzeichnis:** `lib/providers/`

**Provider Pattern mit ChangeNotifier:**

```dart
class RecipeProvider extends ChangeNotifier {
  // State
  List<Recipe> _recipes;
  bool _isLoading;
  String? _error;
  
  // Public Getters
  List<Recipe> get recipes => _recipes;
  
  // Public Methods
  Future<void> loadRecipes() async { ... }
  Future<void> addRecipe(Recipe recipe) async { ... }
  Future<Recipe?> scrapeRecipeFromUrl(String url) async { ... }
}
```

**Provider-Struktur:**

| Provider | Zuständigkeit |
|----------|--------------|
| `RecipeProvider` | Rezept-CRUD, Scraping |
| `PreferencesProvider` | User-Settings, wöchentliche Anpassungen |
| `MealPlanProvider` | Plan-Generierung, Koordination, Einkaufsliste |

### 3. Domain Layer (Services)

**Verzeichnis:** `lib/services/`

#### RecipeScraperService

```dart
class RecipeScraperService {
  Future<Recipe?> scrapeRecipeFromUrl(String url)
  // Strategie:
  // 1. Versuche JSON-LD zu finden (Schema.org Recipe)
  // 2. Fallback: HTML Meta-Tags
  // 3. Fallback: Basic HTML Parsing
}
```

**Unterstützte Formate:**

```json
{
  "@type": "Recipe",
  "name": "Pasta",
  "recipeIngredient": ["400g Nudeln", ...],
  "recipeInstructions": [...],
  "cookTime": "PT20M"
}
```

#### LLMService

```dart
class LLMService {
  Future<String> coordinateCookingSteps(
    List<Recipe> recipes,
    int maxTotalTimeMinutes
  )
  // Koordiniert Schritte für paralleles Kochen
  
  Future<List<Recipe>> suggestRecipes(
    List<Recipe> available,
    List<String> userTags,
    int recipeCount,
    int maxCookingTime
  )
  // Filtert & schlägt Rezepte vor
}
```

**Aktuell:** Mock-Implementierung
**Zukünftig:** Real LLM API Integration

#### LocalStorageService

```dart
class LocalStorageService {
  Future<void> init()
  Future<void> saveRecipe(Recipe recipe)
  Recipe? getRecipe(String id)
  List<Recipe> getAllRecipes()
  Future<void> saveMealPlan(MealPlan plan)
  // ... mehr Storage-Methoden
}
```

### 4. Data Layer (Models)

**Verzeichnis:** `lib/models/` (Freezed)

Alle Modelle sind **immutable** mit Freezed:

```dart
@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    // ...
  }) = _Recipe;
  
  factory Recipe.fromJson(Map<String, dynamic> json) =>
      _$RecipeFromJson(json);
}
```

**Freezed Benefits:**
- Immutability (Value Semantics)
- Pattern Matching
- Copy-With Methoden
- JSON Serialisierung

**Modelle:**
1. `Recipe` + `CookingStep` + `Ingredient`
2. `UserPreferences` + `WeeklyPreferences`
3. `MealPlan` + `PlannedMeal` + `CoordinatedCookingPlan`
4. `ShoppingList` + `ShoppingItem`

## Datenfluss

### Szenario: Rezept von URL hinzufügen

```
User klickt URL eingeben
    ↓
RecipeDetailScreen.onPressed()
    ↓
RecipeProvider.scrapeRecipeFromUrl(url)
    ↓
RecipeScraperService.scrapeRecipeFromUrl(url)
    ├─ HTTP GET request
    ├─ HTML Parsing
    ├─ JSON-LD Extraction
    └─ Recipe Object erstellen
    ↓
RecipeProvider.addRecipe(recipe)
    ├─ LocalStorageService.saveRecipe()
    ├─ _recipes List aktualisieren
    └─ notifyListeners()
    ↓
UI re-rendered mit neuem Rezept
```

### Szenario: Wochenplan generieren

```
User klickt "Wochenplan generieren"
    ↓
MealPlanScreen.onPressed()
    ↓
MealPlanProvider.generateWeeklyMealPlan(
  recipes, userTags, recipeCount, cookingTime
)
    ├─ LLMService.suggestRecipes()
    │  └─ Filtert nach Tags & Zeit
    ├─ LLMService.coordinateCookingSteps()
    │  └─ Erstellt Koordinierungsplan
    ├─ Erstellt MealPlan Object
    ├─ LocalStorageService.saveMealPlan()
    ├─ _generateShoppingList()
    │  └─ Aggregiert Zutaten
    ├─ LocalStorageService.saveShoppingList()
    └─ notifyListeners()
    ↓
UI zeigt Plan + Einkaufsliste
```

## Code-Generierung (Build Runner)

**Freezed + JSON Serializable:**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Generiert:**
- `*.freezed.dart` - Immutable Klassen
- `*.g.dart` - JSON Serialization

**Beispiel:**
```dart
// Input
@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String name,
  }) = _Recipe;
  
  factory Recipe.fromJson(Map<String, dynamic> json) =>
      _$RecipeFromJson(json);
}

// Generated Methods:
// - copyWith()
// - ==, hashCode
// - toString()
// - toJson()
// - fromJson()
```

## State Management Pattern

### Provider Setup (main.dart)

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (_) => RecipeProvider(storage, scraper),
    ),
    ChangeNotifierProvider(
      create: (_) => PreferencesProvider(storage),
    ),
    ChangeNotifierProvider(
      create: (_) => MealPlanProvider(storage, llm),
    ),
  ],
  child: MaterialApp(...)
)
```

### Consumer Usage (Screens)

```dart
Consumer<RecipeProvider>(
  builder: (context, recipeProvider, child) {
    if (recipeProvider.isLoading) {
      return LoadingWidget();
    }
    return RecipeListWidget(recipes: recipeProvider.recipes);
  }
)
```

### Multi-Provider Consumer

```dart
Consumer3<RecipeProvider, PreferencesProvider, MealPlanProvider>(
  builder: (context, recipes, prefs, mealPlan, _) {
    // Access all 3 providers
  }
)
```

## Persistierung mit Hive

**Hive Box Struktur:**

```
┌─ Recipes Box ─────────────────┐
│ id → Recipe (JSON String)     │
├───────────────────────────────┤
│ "123" → '{"name":"..."}' ...  │
└───────────────────────────────┘

┌─ Preferences Box ─────────────┐
│ userId → UserPreferences      │
├───────────────────────────────┤
│ "default_user" → {...}        │
└───────────────────────────────┘

┌─ MealPlans Box ───────────────┐
│ id → MealPlan (JSON)          │
└───────────────────────────────┘

┌─ ShoppingLists Box ───────────┐
│ id → ShoppingList (JSON)      │
└───────────────────────────────┘
```

**Initialisierung:**

```dart
await Hive.initFlutter();
_recipesBox = await Hive.openBox<String>('recipes');
// JSON-String Serialization für MVP
```

## Rezept-Scraping Strategie

### Priority:

```
1. JSON-LD (Schema.org Recipe)
   ✓ Strukturiert
   ✓ Standardisiert
   ✓ Zuverlässig
   
2. HTML Meta-Tags
   ✓ Fallback
   ✓ Mit RegExp
   
3. CSS Selectors Parsing
   ✓ Letzter Versuch
   ✓ Website-spezifisch
```

### Beispiel JSON-LD Parsing:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org/",
  "@type": "Recipe",
  "name": "Pasta Carbonara",
  "prepTime": "PT15M",
  "cookTime": "PT20M",
  "recipeIngredient": [
    "400 g Pasta",
    "200 g Speck"
  ],
  "recipeInstructions": [
    {
      "@type": "HowToStep",
      "text": "Wasser kochen..."
    }
  ]
}
</script>
```

## Koordinierte Kochplanung

### Beispiel: 3 Rezepte parallel kochen

**Input:**
```dart
- Rezept A: 45 Min Gesamtzeit
- Rezept B: 35 Min Gesamtzeit
- Rezept C: 40 Min Gesamtzeit
- Max Kochen: 120 Min
```

**Output (Koordinierter Plan):**
```
00:00-05:00 Min: Vorbereitung alle 3 Rezepte (parallel)
05:00-15:00 Min: Rezept A kochen + Rezept B backen
15:00-20:00 Min: Rezept C kochen (während B fertig wird)
20:00-45:00 Min: Fertigstellung & Plattieren
---
Gesamtzeit: ~45 Min statt 120 Min (3x effizient!)
```

**Mock LLMService Output:**
```dart
"""
🍳 Koordinierter Kochplan

Rezept 1: Pasta Carbonara
Gesamtzeit: 25 Minuten
Schritte:
  1. Wasser kochen (5min)
  2. Pasta kochen (12min)
  3. Soße zubereiten (8min)

Rezept 2: Salat
Gesamtzeit: 10 Minuten
...

⏱️ Gesamtkochzeit (parallel): ~25 Minuten
💡 Tipp: Beginnen Sie mit den längsten Rezepten
"""
```

## Zukünftige Erweiterungen

### 1. LLM Integration

```dart
class LLMService {
  final String apiKey = 'sk-...';
  
  Future<String> coordinateCookingSteps(...) async {
    final client = OpenAIClient(apiKey);
    final response = await client.chat.completions.create(
      model: 'gpt-4',
      messages: [
        SystemMessage(content: 'Du bist ein Kochexperte...'),
        UserMessage(content: 'Koordiniere diese Rezepte...')
      ]
    );
    return response.choices[0].message.content;
  }
}
```

### 2. Cloud Sync (Firebase)

```dart
class FirebaseService {
  Future<void> syncRecipes() async {
    await db.collection('users').doc(userId)
      .collection('recipes').addAll(_recipes);
  }
}
```

### 3. Vision API (Rezept-Fotos)

```dart
class VisionService {
  Future<Recipe> analyzeRecipePhoto(File image) async {
    final response = await openai.vision.analyze(
      imageBase64: base64Encode(image.readAsBytesSync())
    );
    return parseRecipeFromAnalysis(response);
  }
}
```

## Performance-Optimierungen

| Bereich | Optimierung |
|---------|------------|
| **Storage** | Hive für schnellen Zugriff |
| **Rendering** | Consumer Pattern (nur nötige Rebuilds) |
| **Network** | HTTP Caching, Timeout Management |
| **Memory** | Freezed Immutability |
| **UI** | SingleChildScrollView, ListView.builder |

## Testing-Strategie

```
Unit Tests:
  ├─ Models (Freezed)
  ├─ Providers (ChangeNotifier)
  └─ Services (Mocking)

Widget Tests:
  ├─ Screens
  ├─ Provider Integration
  └─ Error States

Integration Tests:
  ├─ Full User Workflows
  └─ Storage Persistence
```

## Error Handling

```dart
try {
  final recipe = await scraper.scrapeUrl(url);
} catch (e) {
  _error = e.toString();
  notifyListeners();
  // UI zeigt SnackBar mit Error
}
```

---

**Version:** 1.0 MVP
**Letzte Aktualisierung:** November 2025
