import '../models/recipe.dart';

class LLMService {
  // Hier kannst du später eine echte LLM-API konfigurieren
  // Für jetzt: Mock-Implementation
  final String? apiKey;
  final String? apiEndpoint;

  LLMService({this.apiKey, this.apiEndpoint});

  /// Koordiniert die Kochschritte von mehreren Rezepten,
  /// um sie parallel zu kochen
  Future<String> coordinateCookingSteps(
    List<Recipe> recipes,
    int maxTotalTimeMinutes,
  ) async {
    try {
      // Placeholder für LLM-Aufrufe
      // In der echten Implementierung würde hier ein LLM
      // wie GPT-4 oder Claude angerufen
      return _mockCoordinateCooking(recipes, maxTotalTimeMinutes);
    } catch (e) {
      return _generateBasicCoordinatedPlan(recipes);
    }
  }

  /// Analysiert ein Rezept-Foto oder Text mit AI
  Future<Recipe?> analyzeRecipeFromImage(String imagePath) async {
    // Placeholder für Vision-API
    // Hier könnte Google Cloud Vision oder OpenAI Vision API verwendet werden
    return null;
  }

  /// Extrahiert Zutaten aus unstrukturiertem Text
  Future<List<String>> extractIngredientsFromText(String text) async {
    try {
      // Placeholder für NLP-Verarbeitung
      return _mockExtractIngredients(text);
    } catch (e) {
      return [];
    }
  }

  /// Gibt Rezept-Vorschläge basierend auf Tags
  Future<List<Recipe>> suggestRecipes(
    List<Recipe> availableRecipes,
    List<String> userTags,
    int recipeCount,
    int maxCookingTime,
  ) async {
    // Filtere Rezepte basierend auf Tags
    final matchingRecipes = availableRecipes.where((recipe) {
      final hasMatchingTag =
          userTags.isEmpty || userTags.any((tag) => recipe.tags.contains(tag));
      final withinTimeLimit = recipe.cookTimeMinutes <= maxCookingTime;
      return hasMatchingTag && withinTimeLimit;
    }).toList();

    // Shuffle und gebe die gewünschte Anzahl zurück
    matchingRecipes.shuffle();
    return matchingRecipes.take(recipeCount).toList();
  }

  String _mockCoordinateCooking(List<Recipe> recipes, int maxTotalTimeMinutes) {
    final buffer = StringBuffer();
    buffer.writeln('🍳 Koordinierter Kochplan\n');

    for (var i = 0; i < recipes.length; i++) {
      buffer.writeln('Rezept ${i + 1}: ${recipes[i].name}');
      buffer.writeln('Gesamtzeit: ${recipes[i].cookTimeMinutes} Minuten');
      buffer.writeln('Schritte:');

      for (var step in recipes[i].cookingSteps) {
        buffer.writeln(
          '  ${step.stepNumber}. ${step.description} (${step.durationMinutes}min)',
        );
      }
      buffer.writeln('');
    }

    // Berechne parallele Schritte
    final totalCookingTime = recipes.fold<int>(
      0,
      (max, recipe) =>
          recipe.cookTimeMinutes > max ? recipe.cookTimeMinutes : max,
    );

    buffer.writeln('⏱️ Gesamtkochzeit (parallel): ~$totalCookingTime Minuten');
    buffer.writeln('💡 Tipp: Beginnen Sie mit den längsten Rezepten');

    return buffer.toString();
  }

  String _generateBasicCoordinatedPlan(List<Recipe> recipes) {
    final buffer = StringBuffer();
    buffer.writeln('🍳 Basis-Kochplan\n');

    // Sortiere Rezepte nach Kochzeit (längste zuerst)
    final sortedRecipes = List<Recipe>.from(recipes)
      ..sort((a, b) => b.cookTimeMinutes.compareTo(a.cookTimeMinutes));

    for (var i = 0; i < sortedRecipes.length; i++) {
      buffer.writeln('Rezept ${i + 1}: ${sortedRecipes[i].name}');
      buffer.writeln('Kochzeit: ${sortedRecipes[i].cookTimeMinutes} Minuten\n');
    }

    return buffer.toString();
  }

  List<String> _mockExtractIngredients(String text) {
    // Einfache Mock-Extraktion: Zerlege Text in Zeilen und Filter
    return text
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty && line.length > 2)
        .toList();
  }
}
