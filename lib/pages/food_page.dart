// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    //initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to add food to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //close the current food page to go back to the menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //food price
                      Text(
                        "\$" + widget.food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      //food description
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.food.description),
                      ),

                      Divider(
                        color: Theme.of(context).colorScheme.primary,
                        indent: 10,
                        endIndent: 10,
                      ),

                      SizedBox(height: 20),

                      Text(
                        "Addons",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      //addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            //get individual addon
                            Addon addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(
                                addon.name,
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Text("\$" + addon.price.toString()),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 13),

                      //button -> add to cart
                      MyButton(
                          onTap: () =>
                              addToCart(widget.food, widget.selectedAddons),
                          text: "Add to Cart"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        //Back Button
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 35,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        )
      ],
    );
  }
}
