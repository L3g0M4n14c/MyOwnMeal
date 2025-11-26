import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/recipe.dart';
import '../../providers/recipe_provider.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final urlController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    urlController.dispose();
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezept hinzufügen'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Von URL'),
            Tab(text: 'Manuell'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // From URL Tab
          _buildFromUrlTab(context),
          // Manual Tab
          _buildManualTab(context),
        ],
      ),
    );
  }

  Widget _buildFromUrlTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: urlController,
            decoration: InputDecoration(
              hintText: 'Rezept-URL einfügen',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.link),
            ),
          ),
          const SizedBox(height: 16),
          Consumer<RecipeProvider>(
            builder: (context, recipeProvider, _) => ElevatedButton(
              onPressed: recipeProvider.isLoading
                  ? null
                  : () async {
                      if (urlController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Bitte URL einfügen')),
                        );
                        return;
                      }

                      final recipe = await recipeProvider.scrapeRecipeFromUrl(
                        urlController.text,
                      );

                      if (mounted) {
                        if (recipe != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Rezept erfolgreich hinzugefügt'),
                            ),
                          );
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                recipeProvider.error ??
                                    'Fehler beim Auslesen des Rezepts',
                              ),
                            ),
                          );
                        }
                      }
                    },
              child: recipeProvider.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Rezept auslesen'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildManualTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Rezeptname',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Beschreibung',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Bitte Rezeptname einfügen')),
                  );
                  return;
                }

                final recipe = Recipe(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameController.text,
                  description: descriptionController.text,
                  ingredients: [],
                  cookingSteps: [],
                  prepTimeMinutes: 15,
                  cookTimeMinutes: 30,
                  servings: 4,
                  tags: [],
                  rating: 0.0,
                  createdAt: DateTime.now(),
                );

                context.read<RecipeProvider>().addRecipe(recipe).then((_) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Rezept erstellt')),
                    );
                    Navigator.of(context).pop();
                  }
                });
              },
              child: const Text('Rezept erstellen'),
            ),
          ],
        ),
      ),
    );
  }
}
