// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_quantity_selector.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //food image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            cartItem.food.imagePath,
                            height: 100,
                          ),
                        ),

                        //name and price
                        Column(
                          children: [
                            Text(
                              cartItem.food.name,
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              '\$${cartItem.totalPrice.toStringAsFixed(2)}',
                            ),
                          ],
                        ),

                        //increment or decrement quantity
                        QuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          onIncrement: () {
                            restaurant.addToCart(
                                cartItem.food, cartItem.selectedAddons);
                          },
                          onDecrement: () {
                            restaurant.removeFromCart(cartItem);
                          },
                        ),
                      ],
                    ),
                  ),
                  //addons
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: cartItem.selectedAddons
                            .map(
                              (addon) => Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: FilterChip(
                                  label: Row(
                                    children: [
                                      //addon name
                                      Text(addon.name),

                                      SizedBox(width: 8),

                                      //addon price
                                      Text("(+\$${addon.price})"),
                                    ],
                                  ),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  onSelected: (value) {},
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontSize: 12),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
