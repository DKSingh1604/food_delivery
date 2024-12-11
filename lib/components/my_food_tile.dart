import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                //text food details
                Expanded(
                  child: Column(
                    children: [
                      Text(food.name),
                      Text(food.price.toString()),
                      Text(food.description),
                    ],
                  ),
                ),

                //food image
                Image.asset(
                  food.imagePath,
                  height: 80,
                ),
              ],
            )),
      )
    ]);
  }
}
