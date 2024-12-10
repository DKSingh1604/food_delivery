import 'package:food_delivery/models/food.dart';

class Restaurant {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic Cheese Burger",
      description:
          "A juicy veg patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/burgers/burger1.webp",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.10),
        Addon(name: "Extra Patty", price: 0.50),
        Addon(name: "Extra Sauce", price: 0.20),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "Smoky BBQ sauce, crispy bacon, and melted cheddar cheese, all on top of a juicy veg patty.",
      imagePath: "assets/images/burgers/burger2.webp",
      price: 1.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Grilled Onions", price: 0.10),
        Addon(name: "Jalepenos", price: 0.50),
        Addon(name: "Extra BBQ Sauce", price: 0.20),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A hearty veggie patty with fresh avacado lettuce and tomato, served on a whole wheat bun.",
      imagePath: "assets/images/burgers/burger3.webp",
      price: 3.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Vegan Cheese", price: 0.10),
        Addon(name: "Grilled Mushrooms", price: 0.50),
        Addon(name: "Hummus Spread", price: 0.20),
      ],
    ),
    Food(
      name: "Aloha Burger",
      description:
          "A char-grilled chicken breast topped with grilled pineapple, swiss cheese, and a tangy teriyaki sauce.",
      imagePath: "assets/images/burgers/burger4.webp",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Teriyaki Glaze", price: 0.10),
        Addon(name: "Extra pineapple", price: 0.50),
        Addon(name: "Bacon", price: 0.20),
      ],
    ),
    Food(
      name: "Blue Moon Burger",
      description:
          "This burger is a blue cheese lover's dream. It features a juicy beef patty topped with blue cheese crumbles, bacon, and caramelized onions.",
      imagePath: "assets/images/burgers/burger5.webp",
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Sauteed Mushrooms", price: 0.10),
        Addon(name: "Fried Egg", price: 0.50),
        Addon(name: "Spicy Mayo", price: 0.20),
      ],
    ),

    //salads
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romains lettuce, parmesan cheese, croutons, and caesar dressing.",
      imagePath: "assets/images/salads/salad1.webp",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.10),
        Addon(name: "Anchovies", price: 0.50),
        Addon(name: "Extra Parmesan", price: 0.20),
      ],
    ),
  ];
}
