class ResepModel {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final int caloriesPerServing;
  final String image;
  final double rating;
  final List<String> mealType;

  ResepModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.caloriesPerServing,
    required this.image,
    required this.rating,
    required this.mealType,
  });

  factory ResepModel.fromJson(Map<String, dynamic> json) {
    return ResepModel(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      caloriesPerServing: json['caloriesPerServing'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      mealType: List<String>.from(json['mealType']),
    );
  }
}
