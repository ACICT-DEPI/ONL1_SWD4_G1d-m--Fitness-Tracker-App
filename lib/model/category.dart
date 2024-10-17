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
  final int? prepTimeInMinutes;
  final String? prepTimeNote;
  final int? cookTimeInMinutes;
  final String? cookTimeNote;
  final String? difficulty;
  final int? serving;
  final List<Measurement> measurements;
  final List<String?> ingredients;
  final List<String?> directions;
  final String image;
  final bool imageCreativeCommons;
  final String? chef;
  final String? sourceUrl;
  final double? calories;
  final double? fatInGrams;
  final double? carbohydratesInGrams;
  final double? proteinInGrams;

  Recipe({
    required this.id,
    required this.recipe,
    required this.category,
     this.prepTimeInMinutes,
    this.prepTimeNote,
     this.cookTimeInMinutes,
    this.cookTimeNote,
     this.difficulty,
     this.serving,
    required this.measurements,
    required this.ingredients,
    required this.directions,
    required this.image,
    required this.imageCreativeCommons,
    this.chef,
    this.sourceUrl,
     this.calories,
     this.fatInGrams,
     this.carbohydratesInGrams,
     this.proteinInGrams,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      recipe: json['recipe'],
      category: CategoryModel.fromJson(json['category']),
      prepTimeInMinutes: json['prep_time_in_minutes'],
      prepTimeNote: json['prep_time_note'],
      cookTimeInMinutes: json['cook_time_in_minutes'],
      cookTimeNote: json['cook_time_note'],
      difficulty: json['difficulty'],
      serving: json['serving'],
      measurements: [
        Measurement(json['measurement_1']),
        Measurement(json['measurement_2']),
        Measurement(json['measurement_3']),
        Measurement(json['measurement_4']),
        Measurement(json['measurement_5']),
        Measurement(json['measurement_6']),
        Measurement(json['measurement_7']),
        Measurement(json['measurement_8']),
        Measurement(json['measurement_9']),
        Measurement(json['measurement_10']),
      ],
      ingredients: [
        json['ingredient_1'],
        json['ingredient_2'],
        json['ingredient_3'],
        json['ingredient_4'],
        json['ingredient_5'],
        json['ingredient_6'],
        json['ingredient_7'],
        json['ingredient_8'],
        json['ingredient_9'],
        json['ingredient_10'],
      ],
      directions: [
        json['directions_step_1'],
        json['directions_step_2'],
        json['directions_step_3'],
        json['directions_step_4'],
        json['directions_step_5'],
        json['directions_step_6'],
        json['directions_step_7'],
        json['directions_step_8'],
        json['directions_step_9'],
        json['directions_step_10'],
      ],
      image: json['image'],
      imageCreativeCommons: json['image_creative_commons'],
      chef: json['chef'],
      sourceUrl: json['source_url'],
      calories: json['calories'],
      fatInGrams: json['fat_in_grams'],
      carbohydratesInGrams: json['carbohydrates_in_grams'],
      proteinInGrams: json['protein_in_grams'],
    );
  }
}

class Measurement {
  final double? value;

  Measurement(this.value);
}


