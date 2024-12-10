// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    //open location search box
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Your location"),
        content: TextField(
          decoration: InputDecoration(
            hintText: "Enter your location..",
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),

          //save button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
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
                    Text(
                      "4542 Hollywood Blvd, Los Angeles",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //drop down menu
                    Icon(Icons.keyboard_arrow_down)
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
