import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_list.freezed.dart';
part 'shopping_list.g.dart';

@freezed
class ShoppingList with _$ShoppingList {
  const factory ShoppingList({
    required String id,
    required String weekIdentifier, // "2025-W48" format
    required List<ShoppingItem> items,
    required bool isChecked,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ShoppingList;

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);
}

@freezed
class ShoppingItem with _$ShoppingItem {
  const factory ShoppingItem({
    required String id,
    required String name,
    required double quantity,
    required String unit,
    required String category, // Gemüse, Getreide, Protein, etc.
    required bool isChecked,
    String? notes,
    required List<String> recipeIds, // Aus welchen Rezepten kommt diese Zutat
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemFromJson(json);
}
