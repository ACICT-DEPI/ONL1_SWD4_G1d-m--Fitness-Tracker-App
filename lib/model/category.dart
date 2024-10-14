class CategoryModel {
  late final int id;
  late final String category;
  late final String thumbnail;

  CategoryModel({
    required this.id,
    required this.category,
    required this.thumbnail,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      category: json['category'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
class Recipe {
  final int id;
  final String recipe;
  final CategoryModel category;
  final int prepTimeInMinutes;
  final int cookTimeInMinutes;
  final String difficulty;
  final int serving;
  final String image;
  final double calories;
  final double fatInGrams;
  final double carbohydratesInGrams;
  final double proteinInGrams;

  Recipe({
    required this.id,
    required this.recipe,
    required this.category,
    required this.prepTimeInMinutes,
    required this.cookTimeInMinutes,
    required this.difficulty,
    required this.serving,
    required this.image,
    required this.calories,
    required this.fatInGrams,
    required this.carbohydratesInGrams,
    required this.proteinInGrams,
  });

  // Factory constructor to create a Recipe instance from JSON
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      recipe: json['recipe'],
      category: CategoryModel.fromJson(json['category']),
      prepTimeInMinutes: json['prep_time_in_minutes'],
      cookTimeInMinutes: json['cook_time_in_minutes'],
      difficulty: json['difficulty'],
      serving: json['serving'],
      image: json['image'],
      calories: (json['calories'] as num).toDouble(),
      fatInGrams: (json['fat_in_grams'] as num).toDouble(),
      carbohydratesInGrams: (json['carbohydrates_in_grams'] as num).toDouble(),
      proteinInGrams: (json['protein_in_grams'] as num).toDouble(),
    );
  }

  // Method to convert a Recipe instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipe': recipe,
      'category': category.toJson(),
      'prep_time_in_minutes': prepTimeInMinutes,
      'cook_time_in_minutes': cookTimeInMinutes,
      'difficulty': difficulty,
      'serving': serving,
      'image': image,
      'calories': calories,
      'fat_in_grams': fatInGrams,
      'carbohydrates_in_grams': carbohydratesInGrams,
      'protein_in_grams': proteinInGrams,
    };
  }
}

