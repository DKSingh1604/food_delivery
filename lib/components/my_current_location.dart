// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  //text controller
  final TextEditingController textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    //open location search box
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Your location"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: "Enter your location..",
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: Text("Cancel"),
          ),

          //save button
          MaterialButton(
            onPressed: () {
              //update delivery address
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);

              Navigator.pop(context);
              textController.clear();
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: GestureDetector(
              onTap: () => openLocationSearchBox(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //address
                    Consumer<Restaurant>(
                      builder: (context, restaurant, child) => Text(
                        restaurant.deliveryAddress,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ),

                    //search or select
                    Icon(Icons.search)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
