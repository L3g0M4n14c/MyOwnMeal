import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/preferences_provider.dart';

const List<String> defaultTags = [
  'vegan',
  'vegetarisch',
  'proteinreich',
  'lowcarb',
  'glutenfrei',
  'nussallergie',
];

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  late List<String> selectedTags;
  late int recipesPerWeek;
  late int cookingTimeMinutes;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final prefsProvider = context.read<PreferencesProvider>();
      selectedTags = List.from(prefsProvider.getActiveTagsForWeek());
      recipesPerWeek = prefsProvider.getActiveRecipesCountForWeek();
      cookingTimeMinutes = prefsProvider.getActiveCookingTimeForWeek();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Dietary Preferences Section
          const Text(
            'Ernährungspräferenzen',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: defaultTags.map((tag) {
              final isSelected = selectedTags.contains(tag);
              return FilterChip(
                label: Text(tag),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedTags.add(tag);
                    } else {
                      selectedTags.remove(tag);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          // Meal Plan Settings Section
          const Text(
            'Wochenplan-Einstellungen',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Recipes per week
          ListTile(
            title: const Text('Gerichte pro Woche'),
            trailing: DropdownButton<int>(
              value: recipesPerWeek,
              items: List.generate(7, (i) => i + 1)
                  .map((n) => DropdownMenuItem(value: n, child: Text('$n')))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    recipesPerWeek = value;
                  });
                }
              },
            ),
          ),
          // Cooking time
          ListTile(
            title: const Text('Max. Kochzeit (Minuten)'),
            trailing: DropdownButton<int>(
              value: cookingTimeMinutes,
              items: [60, 90, 120, 150, 180]
                  .map((n) => DropdownMenuItem(value: n, child: Text('$n min')))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    cookingTimeMinutes = value;
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 32),
          // Save Button
          ElevatedButton(
            onPressed: () async {
              await context
                  .read<PreferencesProvider>()
                  .updateDefaultPreferences(
                    tags: selectedTags,
                    recipesPerWeek: recipesPerWeek,
                    cookingTimeMinutes: cookingTimeMinutes,
                  );

              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Einstellungen gespeichert')),
                );
                Navigator.of(context).pop();
              }
            },
            child: const Text('Speichern'),
          ),
        ],
      ),
    );
  }
}
