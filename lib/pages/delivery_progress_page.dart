// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/my_receipt.dart';
import 'package:food_delivery/services/database/firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //method to call driver
  void callDriver() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("U Sure?"),
          content: Image.asset('assets/images/extras/call_meme.png'),
        );
      },
    );
  }

  //method for message button
  void messageDriver() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: Text("U Sure?"),
          content: Image.asset('assets/images/extras/message_meme.png'),
        );
      },
    );
  }

  //fet access to db
  FirestoreService db = FirestoreService();
  @override
  void initState() {
    super.initState();

    //if we get to this page, submit order to fireabase db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

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
              width: 80,
              height: 80,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text("Driver"),
                  ],
                ),
              ],
            ),
          ),

          //message button
          GestureDetector(
            onTap: () => messageDriver(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.message,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 27,
              ),
            ),
          ),

          //call button
          GestureDetector(
            onTap: () => callDriver(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.call,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 27,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
