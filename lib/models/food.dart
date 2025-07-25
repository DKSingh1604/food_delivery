//food item

class Food {
  final String name; //cheese burger
  final String description; //burger full of cheese
  final String imagePath; //assets/images/cheese_burger.png
  final double price; //10.0
  final FoodCategory category; //FoodCategory.burgers
  List<Addon> availableAddons; //extra cheese, extra patty, extra sauce

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

//food categories
enum FoodCategory {
  Burgers,
  Salads,
  Sides,
  Desserts,
  Drinks,
}

//food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
