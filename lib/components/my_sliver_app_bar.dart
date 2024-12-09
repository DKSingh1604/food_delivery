// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: title,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
      ),
    );
  }
}
