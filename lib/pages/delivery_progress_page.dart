// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/pages/my_receipt.dart';
import 'package:lottie/lottie.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Progress'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: MyReceipt(),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Lottie.asset(
              'assets/animations/delivery_person.json',
              width: 90,
              height: 90,
            ),
          ),
          // SizedBox(width: 20),
          //driver details
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dominic Toretto",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Driver"),
              ],
            ),
          ),

          //message button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 37,
            ),
          ),

          //call button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.call,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 37,
            ),
          ),
        ],
      ),
    );
  }
}
