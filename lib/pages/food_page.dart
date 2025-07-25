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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        //Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //food image
                Hero(
                  tag: 'food_image_${widget.food.name}',
                  child: Container(
                    height: screenHeight * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.food.imagePath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      //food price
                      Text(
                        "\$" + widget.food.price.toString(),
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      //food description
                      Text(
                        widget.food.description,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        thickness: 1,
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      Text(
                        "Add-ons",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.055,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),

                      //addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
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
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
                              subtitle: Text(
                                "\$" + addon.price.toString(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            );
                          },
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      //button -> add to cart
                      MyButton(
                          onTap: () =>
                              addToCart(widget.food, widget.selectedAddons),
                          text: "Add to Cart"),

                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        //Back Button
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                  )
                ],
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: screenWidth * 0.06,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
