import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;
import '../models/recipe.dart';
import 'dart:convert';

class RecipeScraperService {
  Future<Recipe?> scrapeRecipeFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final document = html_parser.parse(response.body);

        // Versuche Rezept-Struktur zu erkennen
        return _parseRecipeFromHtml(document, url);
      }
    } catch (e) {
      // Fehler beim Scraping
    }
    return null;
  }

  Recipe? _parseRecipeFromHtml(dom.Document document, String sourceUrl) {
    // Versuche JSON-LD zu finden (Standard für strukturierte Rezepte)
    final jsonLdScripts = document.querySelectorAll(
      'script[type="application/ld+json"]',
    );

    for (var script in jsonLdScripts) {
      try {
        final json = jsonDecode(script.text);
        if (json is Map &&
            (json['@type'] == 'Recipe' ||
                json['@type']?.toString().contains('Recipe') == true)) {
          return _parseJsonLdRecipe(Map<String, dynamic>.from(json), sourceUrl);
        }
      } catch (e) {
        // Weiter zum nächsten Script
      }
    }

    // Fallback: Versuche einfache Struktur zu scrapen
    return _parseBasicRecipe(document, sourceUrl);
  }

  Recipe _parseJsonLdRecipe(Map<String, dynamic> json, String sourceUrl) {
    final name = json['name'] as String? ?? 'Untitled Recipe';
    final description = json['description'] as String? ?? '';
    final prepTime = _parseIso8601Duration(json['prepTime'] as String?);
    final cookTime = _parseIso8601Duration(json['cookTime'] as String?);
    final servings = int.tryParse(json['servings']?.toString() ?? '') ?? 4;

    final ingredients = <String>[];
    if (json['recipeIngredient'] is List) {
      ingredients.addAll(List<String>.from(json['recipeIngredient'] ?? []));
    }

    final steps = <CookingStep>[];
    if (json['recipeInstructions'] is List) {
      final instructions = json['recipeInstructions'] as List;
      for (var i = 0; i < instructions.length; i++) {
        final instr = instructions[i];
        String stepText = '';

        if (instr is String) {
          stepText = instr;
        } else if (instr is Map) {
          stepText = instr['text'] ?? '';
        }

        if (stepText.isNotEmpty) {
          steps.add(
            CookingStep(
              stepNumber: i + 1,
              description: stepText,
              durationMinutes: 5, // Default
              requiredIngredients: [],
              equipment: [],
            ),
          );
        }
      }
    }

    return Recipe(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      ingredients: ingredients,
      cookingSteps: steps.isEmpty
          ? [
              CookingStep(
                stepNumber: 1,
                description: 'Follow instructions',
                durationMinutes: cookTime,
                requiredIngredients: ingredients,
                equipment: [],
              ),
            ]
          : steps,
      prepTimeMinutes: prepTime,
      cookTimeMinutes: cookTime,
      servings: servings,
      tags: [],
      rating: 0.0,
      sourceUrl: sourceUrl,
      createdAt: DateTime.now(),
    );
  }

  Recipe _parseBasicRecipe(dom.Document document, String sourceUrl) {
    // Fallback-Parsing für einfache HTML-Struktur
    final name = document.querySelector('h1')?.text ?? 'Untitled Recipe';

    final ingredients = <String>[];
    final ingredientElements = document.querySelectorAll(
      '[class*="ingredient"], li[class*="ingredient"]',
    );
    for (var elem in ingredientElements) {
      final text = elem.text.trim();
      if (text.isNotEmpty) {
        ingredients.add(text);
      }
    }

    final steps = <CookingStep>[];
    final instructionElements = document.querySelectorAll(
      '[class*="instruction"], li[class*="step"]',
    );
    for (var i = 0; i < instructionElements.length; i++) {
      final text = instructionElements[i].text.trim();
      if (text.isNotEmpty) {
        steps.add(
          CookingStep(
            stepNumber: i + 1,
            description: text,
            durationMinutes: 5,
            requiredIngredients: [],
            equipment: [],
          ),
        );
      }
    }

    return Recipe(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: '',
      ingredients: ingredients,
      cookingSteps: steps.isEmpty
          ? [
              CookingStep(
                stepNumber: 1,
                description: 'Follow recipe',
                durationMinutes: 30,
                requiredIngredients: ingredients,
                equipment: [],
              ),
            ]
          : steps,
      prepTimeMinutes: 15,
      cookTimeMinutes: 30,
      servings: 4,
      tags: [],
      rating: 0.0,
      sourceUrl: sourceUrl,
      createdAt: DateTime.now(),
    );
  }

  int _parseIso8601Duration(String? durationString) {
    if (durationString == null) return 0;

    // Parse ISO 8601 format: PT5M30S, PT1H30M, etc.
    final regex = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?');
    final match = regex.firstMatch(durationString);

    if (match != null) {
      int hours = int.tryParse(match.group(1) ?? '') ?? 0;
      int minutes = int.tryParse(match.group(2) ?? '') ?? 0;
      int seconds = int.tryParse(match.group(3) ?? '') ?? 0;

      return hours * 60 + minutes + (seconds > 0 ? 1 : 0);
    }

    return 0;
  }
}
