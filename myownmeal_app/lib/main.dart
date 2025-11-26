import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/recipe.dart';
import 'providers/index.dart';
import 'services/index.dart';
import 'screens/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LocalStorageService _storageService;
  late RecipeScraperService _scraperService;
  late LLMService _llmService;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    _storageService = LocalStorageService();
    await _storageService.init();
    _scraperService = RecipeScraperService();
    _llmService = LLMService();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalStorageService>.value(value: _storageService),
        Provider<RecipeScraperService>.value(value: _scraperService),
        Provider<LLMService>.value(value: _llmService),
        ChangeNotifierProvider(
          create: (_) => RecipeProvider(_storageService, _scraperService),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(_storageService),
        ),
        ChangeNotifierProvider(
          create: (_) => MealPlanProvider(_storageService, _llmService),
        ),
      ],
      child: MaterialApp(
        title: 'MyOwnMeal',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        routes: {
          '/preferences': (context) => const PreferencesScreen(),
          '/add_recipe': (context) => const AddRecipeScreen(),
          '/meal_plan': (context) => const MealPlanScreen(),
          '/recipe_detail': (context) {
            final recipe = ModalRoute.of(context)?.settings.arguments;
            if (recipe is! Recipe) {
              return const Scaffold(
                body: Center(child: Text('Error: Recipe not found')),
              );
            }
            return RecipeDetailScreen(recipe: recipe);
          },
        },
      ),
    );
  }
}
