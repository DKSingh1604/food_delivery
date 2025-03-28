// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  userCart.isEmpty
                      ? showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Your cart is already empty!"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("OK"),
                              ),
                            ],
                          ),
                        )
                      : showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                                "Are you sure you want to clear the cart?"),
                            actions: [
                              //No button
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("No"),
                              ),

                              //yes button
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  restaurant.clearCart();
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          ),
                        );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              //list of cart items
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                            child: Center(
                              child: const Text("Your cart is empty"),
                            ),
                          )
                        : Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: userCart.length,
                                      itemBuilder: (context, index) {
                                        //get individual cart item
                                        final cartItem = userCart[index];

                                        //return cart tile UI
                                        return MyCartTile(cartItem: cartItem);
                                      }),
                                ),
                                MyButton(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentPage(),
                                    ),
                                  ),
                                  text: "Proceed to Checkout",
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
