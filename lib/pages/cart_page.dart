// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            title: Text(
              "My Cart",
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.surface,
            elevation: 0,
            foregroundColor: Theme.of(context).colorScheme.primary,
            actions: [
              //clear cart button
              Container(
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    if (userCart.isEmpty) {
                      _showEmptyCartDialog(context);
                    } else {
                      _showClearCartDialog(context, restaurant);
                    }
                  },
                ),
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                ],
              ),
            ),
            child: Column(
              children: [
                //list of cart items
                Expanded(
                  child: userCart.isEmpty
                      ? _buildEmptyCart(context)
                      : ListView.builder(
                          padding: EdgeInsets.only(top: 16, bottom: 100),
                          itemCount: userCart.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            //get individual cart item
                            final cartItem = userCart[index];

                            //return cart tile UI with animation
                            return TweenAnimationBuilder<double>(
                              duration:
                                  Duration(milliseconds: 600 + (index * 100)),
                              tween: Tween(begin: 0.0, end: 1.0),
                              curve: Curves.elasticOut,
                              builder: (context, value, child) {
                                return Transform.translate(
                                  offset: Offset(
                                      0, 50 * (1 - value.clamp(0.0, 1.0))),
                                  child: Opacity(
                                    opacity: value.clamp(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.04,
                                          vertical: 8),
                                      child: MyCartTile(cartItem: cartItem),
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                ),
              ],
            ),
          ),
          bottomSheet: userCart.isEmpty
              ? null
              : _buildCheckoutSection(context, restaurant),
        );
      },
    );
  }

  // Enhanced empty cart widget
  Widget _buildEmptyCart(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: TweenAnimationBuilder<double>(
        duration: Duration(milliseconds: 1000),
        tween: Tween(begin: 0.0, end: 1.0),
        curve: Curves.elasticOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value.clamp(0.0, 1.0),
            child: Opacity(
              opacity: value.clamp(0.0, 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: screenWidth * 0.25,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Your Cart is Empty",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Looks like you haven't added anything yet.",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.04,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Enhanced checkout section as a bottom sheet
  Widget _buildCheckoutSection(BuildContext context, Restaurant restaurant) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding:
          EdgeInsets.fromLTRB(screenWidth * 0.06, 20, screenWidth * 0.06, 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                "\$${restaurant.getTotalPrice().toStringAsFixed(2)}",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          MyButton(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentPage(),
              ),
            ),
            text: "Proceed to Checkout",
            icon: Icons.arrow_forward_ios_rounded,
          ),
        ],
      ),
    );
  }

  // Enhanced dialog for clearing cart
  void _showClearCartDialog(BuildContext context, Restaurant restaurant) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Clear Cart?",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        content: Text(
          "Are you sure you want to remove all items from your cart?",
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: GoogleFonts.poppins()),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              restaurant.clearCart();
            },
            child: Text(
              "Clear",
              style: GoogleFonts.poppins(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }

  // Enhanced dialog for empty cart
  void _showEmptyCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Cart is Empty",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        content: Text(
          "There's nothing to clear.",
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }
}
