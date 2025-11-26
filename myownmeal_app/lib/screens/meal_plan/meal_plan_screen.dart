import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/meal_plan_provider.dart';
import '../../providers/recipe_provider.dart';
import '../../providers/preferences_provider.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({Key? key}) : super(key: key);

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wochenplan'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Plan erstellen'),
            Tab(text: 'Einkaufsliste'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildMealPlanTab(context), _buildShoppingListTab(context)],
      ),
    );
  }

  Widget _buildMealPlanTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer3<RecipeProvider, PreferencesProvider, MealPlanProvider>(
        builder: (context, recipeProvider, prefsProvider, mealPlanProvider, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Settings for this week
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Diese Woche anpassen',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Tagsüber werden Ihre Default-Werte nicht geändert',
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Show settings dialog
                          },
                          child: const Text('Einstellungen für diese Woche'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Generate Plan Button
                Consumer<MealPlanProvider>(
                  builder: (context, mealPlanProvider, _) => ElevatedButton(
                    onPressed: mealPlanProvider.isLoading
                        ? null
                        : () async {
                            final userTags = prefsProvider
                                .getActiveTagsForWeek();
                            final recipesCount = prefsProvider
                                .getActiveRecipesCountForWeek();
                            final cookingTime = prefsProvider
                                .getActiveCookingTimeForWeek();

                            await mealPlanProvider.generateWeeklyMealPlan(
                              recipeProvider.recipes,
                              userTags,
                              recipesCount,
                              cookingTime,
                            );

                            if (mounted && mealPlanProvider.error == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Wochenplan erstellt!'),
                                ),
                              );
                            }
                          },
                    child: mealPlanProvider.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Wochenplan generieren'),
                  ),
                ),
                const SizedBox(height: 24),
                // Current Plan
                if (mealPlanProvider.currentMealPlan != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ihr Wochenplan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...mealPlanProvider.currentMealPlan!.meals
                          .map(
                            (meal) => Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: ListTile(
                                title: Text(meal.recipe.name),
                                subtitle: Text(
                                  'Tag ${meal.dayOfWeek} • ${meal.mealType}',
                                ),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                            ),
                          )
                          .toList(),
                      const SizedBox(height: 16),
                      if (mealPlanProvider.coordinatedPlanText != null)
                        Card(
                          color: Colors.blue.shade50,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '🍳 Koordinierter Kochplan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  mealPlanProvider.coordinatedPlanText!,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                if (mealPlanProvider.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: AlertDialog(
                      content: Text(mealPlanProvider.error ?? ''),
                      actions: [
                        TextButton(
                          onPressed: mealPlanProvider.clearError,
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildShoppingListTab(BuildContext context) {
    return Consumer<MealPlanProvider>(
      builder: (context, mealPlanProvider, _) {
        if (mealPlanProvider.currentShoppingList == null) {
          return const Center(
            child: Text(
              'Erstellen Sie einen Wochenplan um eine Einkaufsliste zu generieren',
            ),
          );
        }

        final list = mealPlanProvider.currentShoppingList!;

        return ListView.builder(
          itemCount: list.items.length,
          itemBuilder: (context, index) {
            final item = list.items[index];
            return CheckboxListTile(
              title: Text(item.name),
              subtitle: Text('${item.quantity} ${item.unit}'),
              value: item.isChecked,
              onChanged: (value) {
                if (value != null) {
                  mealPlanProvider.updateShoppingItemCheck(item.id, value);
                }
              },
            );
          },
        );
      },
    );
  }
}
