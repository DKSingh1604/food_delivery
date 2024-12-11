// ignore_for_file: prefer_interpolation_to_compose_strings

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
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  //text food details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$" + food.price.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          food.description,
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),

                  //food image
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        food.imagePath,
                        height: 120,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Divider(
        color: Theme.of(context).colorScheme.primary,
        endIndent: 25,
        indent: 25,
      ),
    ]);
  }
}
