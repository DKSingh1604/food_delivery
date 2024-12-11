import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic Cheese Burger",
      description:
          "A juicy veg patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/burgers/burger1.jpeg",
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
      imagePath: "assets/images/burgers/burger2.jpeg",
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
      imagePath: "assets/images/burgers/burger3.jpeg",
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
      imagePath: "assets/images/burgers/burger4.jpeg",
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
      imagePath: "assets/images/burgers/burger5.jpeg",
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
      imagePath: "assets/images/salads/salad1.jpeg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.10),
        Addon(name: "Anchovies", price: 0.50),
        Addon(name: "Extra Parmesan", price: 0.20),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "Tomatoes, cucumbers, red onions, kalamata olives, and feta cheese tossed in a greek vinaigrette.",
      imagePath: "assets/images/salads/salad2.jpeg",
      price: 8.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Feta Cheese", price: 0.10),
        Addon(name: "Kalamata Olives", price: 0.50),
        Addon(name: "Grilled Shrimp", price: 0.20),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description:
          "Quinoa mixed with cucumbers, tomatoes, red onions, and a lemon vinaigrette.",
      imagePath: "assets/images/salads/salad3.jpeg",
      price: 5.29,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Avocado", price: 0.10),
        Addon(name: "Feta Cheese", price: 0.50),
        Addon(name: "Grilled Chicken", price: 1.20),
      ],
    ),
    Food(
      name: "Asian Sesame Salad",
      description:
          "Delight in the flavours of the East with this salad. It features mixed greens, mandarin oranges, almonds, and a sesame ginger dressing.",
      imagePath: "assets/images/salads/salad4.jpeg",
      price: 6.79,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Mandarin Oranges", price: 0.10),
        Addon(name: "Almond Silvers", price: 0.50),
        Addon(name: "Extra Teriyaki Chicken", price: 1.20),
      ],
    ),
    Food(
      name: "South West Chicken Salad",
      description:
          "This colorful salad combines the zesty flavors of the Southwest. It features mixed greens, black beans, corn, tomatoes, and grilled chicken.",
      imagePath: "assets/images/salads/salad5.jpeg",
      price: 9.29,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Sour Cream", price: 0.10),
        Addon(name: "Pico de Gallo", price: 0.50),
        Addon(name: "Guacamole", price: 1.20),
      ],
    ),

    //sides
    Food(
      name: "Sweet Potato Fries",
      description: "Crispy sweet potato with a touch of salt.",
      imagePath: "assets/images/sides/side1.jpeg",
      price: 3.29,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.10),
        Addon(name: "Truffle Oil", price: 0.50),
        Addon(name: "Cajun Spice", price: 1.20),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Golden and crispy onion rings, perfect for dipping",
      imagePath: "assets/images/sides/side2.jpeg",
      price: 5.29,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Ranch Dip", price: 0.10),
        Addon(name: "Spicy Mayo", price: 0.50),
        Addon(name: "Parmesan Dust", price: 1.20),
      ],
    ),
    Food(
      name: "Garlic Bread",
      description:
          "Warm and toasty bread, topped with melted butter and parsley",
      imagePath: "assets/images/sides/side3.jpeg",
      price: 7.29,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.10),
        Addon(name: "Truffle Oil", price: 0.50),
        Addon(name: "Cajun Spice", price: 1.20),
      ],
    ),
    Food(
      name: "Loaded Sweet Potato Fries",
      description:
          "Savoury sweet potato fries loaded with melted cheese, smoky bacon bits and a dollop of sour cream.",
      imagePath: "assets/images/sides/side4.jpeg",
      price: 4.79,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Sour Cream", price: 0.10),
        Addon(name: "Bacon Bits", price: 0.50),
        Addon(name: "Green Onions", price: 1.20),
      ],
    ),
    Food(
      name: "Crispy Mac & Cheese Bites",
      description:
          "Golden brown, bite-sized mac and cheese balls, perfect for on-the-go snacking.",
      imagePath: "assets/images/sides/side5.jpeg",
      price: 7.59,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Bacon Bits", price: 0.10),
        Addon(name: "Jalapeno Slices", price: 0.50),
        Addon(name: "Spiracha Drizzle", price: 1.20),
      ],
    ),

    //desserts
    Food(
      name: "Chocolate Brownie",
      description: "A rich, chocolate cake with a gooey, molten center.",
      imagePath: "assets/images/desserts/dessert1.jpeg",
      price: 3.29,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 0.10),
        Addon(name: "Hot Fudge", price: 0.50),
        Addon(name: "Whipped Cream", price: 1.20),
      ],
    ),
    Food(
      name: "Cheese Cake",
      description:
          "Creamy cheesecake on a graham cracker crust, with a berry compote.",
      imagePath: "assets/images/desserts/dessert2.jpeg",
      price: 2.29,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Stawberry Topping", price: 0.10),
        Addon(name: "Bluberry Compote", price: 0.50),
        Addon(name: "Chocolate Chips", price: 1.20),
      ],
    ),
    Food(
      name: "Apple Pie",
      description: "A rich, chocolate cake with a gooey, molten apple center.",
      imagePath: "assets/images/desserts/dessert3.jpeg",
      price: 3.29,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 0.10),
        Addon(name: "Hot Fudge", price: 0.50),
        Addon(name: "Whipped Cream", price: 1.20),
      ],
    ),
    Food(
      name: "Red Velvet Lava Cake",
      description:
          "A delecatable red velvet cake with a molten chocolate center.",
      imagePath: "assets/images/desserts/dessert4.jpeg",
      price: 9.29,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Raspberry Sauce", price: 0.10),
        Addon(name: "Cream Cheese Icing", price: 0.50),
        Addon(name: "Chocolate Sprinkles", price: 1.20),
      ],
    ),
    Food(
      name: "Choco Lava Cake",
      description: "A rich, chocolate cake with a gooey, molten center.",
      imagePath: "assets/images/desserts/dessert5.jpeg",
      price: 8.09,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 0.10),
        Addon(name: "Hot Fudge", price: 0.50),
        Addon(name: "Whipped Cream", price: 1.20),
      ],
    ),

    //drinks
    Food(
      name: "Lemonade",
      description:
          "Freshly squeezed lemons, sweetened with sugar and served over ice.",
      imagePath: "assets/images/drinks/drink1.jpeg",
      price: 3.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Strawberry Flavor", price: 0.10),
        Addon(name: "Mint Leaves", price: 0.50),
        Addon(name: "Ginger Zest", price: 1.20),
      ],
    ),
    Food(
      name: "Iced Tea",
      description:
          "A refreshing blend of black tea, sweetened with sugar and served over ice.",
      imagePath: "assets/images/drinks/drink2.jpeg",
      price: 4.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Peach flavor", price: 0.10),
        Addon(name: "Lemon Slices", price: 0.50),
        Addon(name: "Honey", price: 1.20),
      ],
    ),
    Food(
      name: "Smoothie",
      description:
          "A blend of fresh fruit, yogurt, and honey, served over ice.",
      imagePath: "assets/images/drinks/drink3.jpeg",
      price: 7.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein Powder", price: 0.10),
        Addon(name: "Almond Milk", price: 0.50),
        Addon(name: "Chia seeds", price: 1.20),
      ],
    ),
    Food(
      name: "Mojito",
      description:
          "A refreshing blend of fresh mint, lime juice, sugar, and soda water.",
      imagePath: "assets/images/drinks/drink4.jpeg",
      price: 1.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Strawberry Flavor", price: 0.10),
        Addon(name: "Mint Leaves", price: 0.50),
        Addon(name: "Ginger Zest", price: 1.20),
      ],
    ),
    Food(
      name: "Caramel Macchiato",
      description:
          "Freshly squeezed lemons, sweetened with sugar and served over ice.",
      imagePath: "assets/images/drinks/drink5.jpeg",
      price: 7.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Shot of Expresso", price: 0.10),
        Addon(name: "Hazlenut Syrup", price: 0.50),
        Addon(name: "Whipped Cream", price: 1.20),
      ],
    ),
  ];

  //G E T T E R S
  List<Food> get menu => _menu;

  //O P E R A T I O N S

  //add to cart

  //remove from cart

  // get total price of cart

  // get total number od items in the cart

  // clear cart

  //H E L P E R S

  //generate a receipt

  //format double value into money

  // format list of addons into a string summary
}
