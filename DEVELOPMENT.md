# 🛠️ Development Guide - MyOwnMeal

Technische Dokumentation für Entwickler.

## 📦 Abhängigkeiten

### Core Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.0.0           # State & Dependency Injection
  get_it: ^7.6.0             # Service Locator (optional)
  
  # Lokale Persistierung
  hive: ^2.2.3               # NoSQL DB
  hive_flutter: ^1.1.0       # Flutter Integration
  
  # HTTP & Networking
  http: ^1.1.0               # HTTP Client
  dio: ^5.3.0                # Advanced HTTP (optional)
  
  # HTML Parsing
  html: ^0.15.4              # DOM Parsing
  
  # JSON & Serialization
  json_annotation: ^4.8.1    # Annotations
  freezed_annotation: ^2.4.1 # Immutable Models
  
  # Utilities
  intl: ^0.19.0              # Internationalization
  validators: ^3.0.0         # Validierung
  go_router: ^14.0.0         # Advanced Routing (optional)

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Code Generation
  build_runner: ^2.4.6
  hive_generator: ^2.0.1
  json_serializable: ^6.7.1
  freezed: ^2.4.1
```

## 🗂️ Ordnerstruktur Erklärung

```
lib/
├── main.dart
│   └─ Entry Point, Provider Setup, Routing
│
├── models/              # Datenstrukturen (Freezed + JSON)
│   ├── recipe.dart
│   ├── user_preferences.dart
│   ├── meal_plan.dart
│   ├── shopping_list.dart
│   └── index.dart       # Re-exports
│
├── services/            # Business Logic (Stateless)
│   ├── recipe_scraper_service.dart
│   │  └─ URL Parsing, JSON-LD Extraktion
│   ├── llm_service.dart
│   │  └─ Mock LLM, Koordination
│   ├── local_storage_service.dart
│   │  └─ Hive Persistierung
│   └── index.dart
│
├── providers/           # State Management (ChangeNotifier)
│   ├── recipe_provider.dart
│   │  └─ CRUD Rezepte, Scraping
│   ├── preferences_provider.dart
│   │  └─ User Settings, Weekly Overrides
│   ├── meal_plan_provider.dart
│   │  └─ Plan Generation, Shopping List
│   └── index.dart
│
└── screens/             # UI Widgets
    ├── home/
    │  └─ home_screen.dart
    ├── preferences/
    │  └─ preferences_screen.dart
    ├── recipes/
    │  ├─ add_recipe_screen.dart
    │  └─ recipe_detail_screen.dart
    ├── meal_plan/
    │  └─ meal_plan_screen.dart
    └── index.dart
```

## 🔄 Development Workflow

### 1. Neue Funktion hinzufügen

```bash
# 1. Branch erstellen
git checkout -b feature/new-feature

# 2. Code schreiben in entsprechenden Layer
# z.B. neue Service-Methode

# 3. Code generieren wenn Models geändert
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Test schreiben
flutter test

# 5. Analysieren
flutter analyze

# 6. Formatieren
dart format .

# 7. Commit & Push
git add .
git commit -m "feat: add new feature"
git push origin feature/new-feature
```

### 2. Model hinzufügen

**Schritt 1: Model Klasse schreiben**
```dart
// lib/models/new_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_model.freezed.dart';
part 'new_model.g.dart';

@freezed
class NewModel with _$NewModel {
  const factory NewModel({
    required String id,
    required String name,
  }) = _NewModel;

  factory NewModel.fromJson(Map<String, dynamic> json) =>
      _$NewModelFromJson(json);
}
```

**Schritt 2: Code generieren**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Schritt 3: Nutzen**
```dart
final model = NewModel(id: '1', name: 'Test');
final json = model.toJson();
final restored = NewModel.fromJson(json);
```

### 3. Service hinzufügen

```dart
// lib/services/my_service.dart
class MyService {
  // Stateless, keine Provider-Dependencies
  Future<String> doSomething() async {
    return 'result';
  }
}

// In main.dart Provider Setup:
Provider<MyService>.value(value: MyService()),
```

### 4. Provider hinzufügen

```dart
// lib/providers/my_provider.dart
class MyProvider with ChangeNotifier {
  final MyService _service;
  
  MyProvider(this._service);
  
  String _data = '';
  String get data => _data;
  
  Future<void> fetchData() async {
    _data = await _service.doSomething();
    notifyListeners();
  }
}

// In main.dart:
ChangeNotifierProvider(
  create: (_) => MyProvider(MyService()),
),
```

### 5. Screen hinzufügen

```dart
// lib/screens/my_feature/my_screen.dart
class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  void initState() {
    super.initState();
    // Init logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Screen')),
      body: Consumer<MyProvider>(
        builder: (context, provider, _) {
          return Center(child: Text(provider.data));
        },
      ),
    );
  }
}

// In main.dart routes:
'/my_screen': (context) => const MyScreen(),
```

## 🧪 Testing

### Unit Test Beispiel

```dart
// test/services/recipe_scraper_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:myownmeal_app/services/recipe_scraper_service.dart';

void main() {
  group('RecipeScraperService', () {
    late RecipeScraperService service;

    setUp(() {
      service = RecipeScraperService();
    });

    test('parses JSON-LD recipe correctly', () async {
      // Arrange
      const url = 'https://example.com/recipe';
      
      // Act
      final recipe = await service.scrapeRecipeFromUrl(url);
      
      // Assert
      expect(recipe, isNotNull);
      expect(recipe!.name, isNotEmpty);
    });

    test('handles invalid URL gracefully', () async {
      // Arrange
      const url = 'https://invalid-url-that-doesnt-exist.xyz';
      
      // Act
      final recipe = await service.scrapeRecipeFromUrl(url);
      
      // Assert
      expect(recipe, isNull);
    });
  });
}
```

### Widget Test Beispiel

```dart
// test/screens/home_screen_test.dart
void main() {
  testWidgets('HomeScreen shows recipes', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RecipeProvider(...)),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // Verify appbar exists
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('MyOwnMeal'), findsOneWidget);

    // Tap button
    await tester.tap(find.text('Rezept hinzufügen'));
    await tester.pumpAndSettle();

    // Verify navigation
    expect(find.byType(AddRecipeScreen), findsOneWidget);
  });
}
```

## 🐛 Debugging

### Logging

```dart
// Einfaches Logging
print('Debug: $variable');

// Mit StackTrace
try {
  // code
} catch (e, stackTrace) {
  print('Error: $e\nStackTrace: $stackTrace');
}
```

### DevTools

```bash
# Flutter DevTools öffnen
flutter pub global activate devtools
flutter pub global run devtools

# Oder direkt bei flutter run
# - Drücke 'd' für DevTools
```

### Provider Inspector

```dart
// In main.dart zum Debugging hinzufügen
// (Nur für Development!)
final providers = [
  // ... providers
];

MultiProvider(
  providers: providers,
  child: MaterialApp(...),
)
```

## 🚀 Performance Tipps

### 1. Rendering Optimization

```dart
// ❌ Bad: Rebuilds unnecessarily
Consumer<RecipeProvider>(
  builder: (context, provider, _) => Scaffold(
    body: Text(provider.recipes[0].name),
    appBar: AppBar(title: const Text('Title')),
  ),
)

// ✅ Good: Separates concerns
Scaffold(
  appBar: AppBar(title: const Text('Title')),
  body: Consumer<RecipeProvider>(
    builder: (context, provider, _) => Text(provider.recipes[0].name),
  ),
)
```

### 2. List Building

```dart
// ❌ Bad: Creates new list
ListView(children: provider.recipes.map(...).toList())

// ✅ Good: Uses ListView.builder
ListView.builder(
  itemCount: provider.recipes.length,
  itemBuilder: (context, index) => RecipeCard(
    recipe: provider.recipes[index],
  ),
)
```

### 3. State Splitting

```dart
// ❌ Bad: One huge provider
class AppProvider extends ChangeNotifier {
  // Recipes, Preferences, MealPlans, Shopping List...
}

// ✅ Good: Separated concerns
RecipeProvider
PreferencesProvider
MealPlanProvider
```

## 🔐 Security

### API Keys

```dart
// ❌ Never hardcode
const String API_KEY = 'sk-xxx';

// ✅ Use .env
// .env
// OPENAI_API_KEY=sk-xxx

// .dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiKey = dotenv.env['OPENAI_API_KEY'];
```

### Datenvalidierung

```dart
// Validate user input
String? validateUrl(String url) {
  if (url.isEmpty) return 'URL cannot be empty';
  if (!url.startsWith('http')) return 'Invalid URL';
  return null; // Valid
}

// Use in TextField
TextField(
  onChanged: (value) {
    final error = validateUrl(value);
    if (error != null) {
      print('Error: $error');
    }
  },
)
```

## 📊 Error Handling Pattern

```dart
// Service Layer
class MyService {
  Future<Result<T>> execute<T>(Function() action) async {
    try {
      final data = await action();
      return Success(data);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}

// Provider Layer
class MyProvider extends ChangeNotifier {
  String? _error;
  
  Future<void> fetchData() async {
    try {
      // Do something
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}

// UI Layer
Consumer<MyProvider>(
  builder: (context, provider, _) {
    if (provider.error != null) {
      return ErrorWidget(error: provider.error!);
    }
    return SuccessWidget();
  }
)
```

## 📝 Code Style

### Naming Conventions

```dart
// Classes: PascalCase
class RecipeProvider {}

// Methods/Variables: camelCase
void addRecipe() {}
String recipeName = '';

// Constants: camelCase
const defaultCookingTime = 120;

// Private: underscore prefix
String _privateVariable = '';

// Booleans: is/has prefix
bool isLoading = false;
bool hasError = false;
```

### Comments

```dart
// Good comments
/// Fetches recipes from local storage
/// Returns empty list if no recipes found
List<Recipe> getAllRecipes()

// Bad comments
// Get recipes
List<Recipe> getRecipes()

// TODOs
// TODO: Add error handling
// FIXME: This crashes when...
// NOTE: This must be called after init
```

## 🔗 Git Workflow

```bash
# 1. Erstelle Feature Branch
git checkout -b feature/my-feature

# 2. Mache regelmäßig Commits
git add .
git commit -m "feat: implement recipe scraping"

# 3. Bevor merge: Pull Latest
git pull origin main

# 4. Push und erstelle PR
git push origin feature/my-feature
```

### Commit Message Format

```
feat: add new feature
fix: fix a bug
docs: update documentation
style: format code
refactor: reorganize code
perf: performance improvement
test: add tests
```

## 📚 Ressourcen

- [Flutter Docs](https://flutter.dev)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Provider Pattern](https://pub.dev/packages/provider)
- [Freezed Doc](https://pub.dev/packages/freezed)
- [Flutter Best Practices](https://flutter.dev/docs/testing/best-practices)

## 🎓 Learning Path

### Anfänger
1. Flutter Basics verstehen
2. Provider Pattern lernen
3. Einfache Screens bauen

### Intermediate
1. Datenmodelle mit Freezed
2. HTTP Requests
3. Local Storage

### Advanced
1. LLM Integration
2. Performance Optimization
3. Testing & CI/CD

---

**Version:** 1.0 MVP
**Letzte Aktualisierung:** November 2025
