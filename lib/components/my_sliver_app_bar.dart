// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 60,
      floating: false,
      pinned: true,
      actions: [
        //cart button with enhanced styling
        Container(
          margin: EdgeInsets.only(right: 12, top: 8, bottom: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.primary.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            ),
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Theme.of(context).colorScheme.primary.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo with animation
            // TweenAnimationBuilder<double>(
            //   duration: Duration(milliseconds: 2000),
            //   tween: Tween(begin: 0.0, end: 1.0),
            //   curve: Curves.elasticOut,
            //   builder: (context, value, child) {
            //     return Transform.rotate(
            //       angle: value * 0.1,
            //       child: Container(
            //         width: 32,
            //         height: 32,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(8),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Theme.of(context)
            //                   .colorScheme
            //                   .primary
            //                   .withOpacity(0.2),
            //               blurRadius: 4,
            //               offset: Offset(0, 2),
            //             ),
            //           ],
            //         ),
            //         // child: ClipRRect(
            //         //   borderRadius: BorderRadius.circular(8),
            //         //   child: Image.asset(
            //         //     'assets/logos/zwiggy.png',
            //         //     fit: BoxFit.cover,
            //         //   ),
            //         // ),
            //       ),
            //     );
            //   },
            // ),
            SizedBox(width: 12),
            // Enhanced title text
            Text(
              "ZWIGGY",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
                color: Theme.of(context).colorScheme.primary,
                shadows: [
                  Shadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
      ),
    );
  }
}
