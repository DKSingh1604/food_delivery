// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_current_location.dart';
import 'package:food_delivery/components/my_description_box.dart';
import 'package:food_delivery/components/my_drawer.dart';
import 'package:food_delivery/components/my_food_tile.dart';
import 'package:food_delivery/components/my_sliver_app_bar.dart';
import 'package:food_delivery/components/my_tab_bar.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/food_page.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface.withOpacity(0.95),
              Theme.of(context).colorScheme.surface.withOpacity(0.8),
              Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
        child: categoryMenu.isEmpty
            ? _buildEmptyState(category)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category header with enhanced styling
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 16, 20, 12),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            _getCategoryIcon(category),
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "${category.toString().split('.').last} (${categoryMenu.length} items)",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Enhanced ListView with staggered animations
                  Expanded(
                    child: ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      itemCount: categoryMenu.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        //get individual food item
                        final food = categoryMenu[index];

                        // Enhanced return food tile UI with improved animation
                        return TweenAnimationBuilder<double>(
                          duration: Duration(milliseconds: 800 + (index * 150)),
                          tween: Tween(begin: 0.0, end: 1.0),
                          curve: Curves.elasticOut,
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(50 * (1 - value), 0),
                              child: Opacity(
                                opacity: value.clamp(0.0, 1.0),
                                child: Transform.scale(
                                  scale: (0.8 + (0.2 * value)).clamp(0.1, 2.0),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Theme.of(context).colorScheme.surface,
                                          Theme.of(context)
                                              .colorScheme
                                              .tertiary
                                              .withOpacity(0.8),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.1),
                                          blurRadius: 15,
                                          offset: Offset(0, 8),
                                          spreadRadius: 0,
                                        ),
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .shadowColor
                                              .withOpacity(0.05),
                                          blurRadius: 6,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.08),
                                        width: 1,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          splashColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.1),
                                          highlightColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.05),
                                          onTap: () => _navigateToFoodPage(
                                              context, food),
                                          child: FoodTile(
                                            food: food,
                                            onTap: () => _navigateToFoodPage(
                                                context, food),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
      );
    }).toList();
  }

  // Enhanced navigation with animation and haptic feedback
  void _navigateToFoodPage(BuildContext context, Food food) {
    // Add haptic feedback
    // HapticFeedback.lightImpact(); // Uncomment if you want haptic feedback

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FoodPage(food: food),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Enhanced slide and fade transition
          var slideAnimation = Tween(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.fastEaseInToSlowEaseOut,
          ));

          var fadeAnimation = Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Interval(0.0, 0.8, curve: Curves.easeOut),
          ));

          var scaleAnimation = Tween(
            begin: 0.8,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
          ));

          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: child,
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 600),
        reverseTransitionDuration: Duration(milliseconds: 400),
      ),
    );
  }

  // Enhanced empty state widget with animations
  Widget _buildEmptyState(FoodCategory category) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 1200),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: (0.8 + (0.2 * value)).clamp(0.1, 2.0),
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated container with pulsing effect
                    TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 2000),
                      tween: Tween(begin: 0.8, end: 1.0),
                      curve: Curves.easeInOut,
                      builder: (context, pulseValue, child) {
                        return Transform.scale(
                          scale: pulseValue.clamp(0.1, 2.0),
                          child: Container(
                            padding: EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.15),
                                  Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.05),
                                ],
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.2),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              _getCategoryIcon(category),
                              size: 64,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 24),

                    // Enhanced title with better typography
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "No ${category.toString().split('.').last} Available",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Enhanced subtitle
                    Text(
                      "We're cooking up something delicious!\nCheck back soon for amazing options.",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(0.8),
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),

                    // Add a subtle call-to-action button
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.refresh_rounded,
                            size: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Pull to refresh",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method to get category-specific icons
  IconData _getCategoryIcon(FoodCategory category) {
    switch (category) {
      case FoodCategory.Burgers:
        return Icons.lunch_dining;
      case FoodCategory.Salads:
        return Icons.local_florist;
      case FoodCategory.Sides:
        return Icons.rice_bowl;
      case FoodCategory.Desserts:
        return Icons.cake;
      case FoodCategory.Drinks:
        return Icons.local_drink;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.5,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.03),
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.secondary.withOpacity(0.02),
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.surface.withOpacity(0.95),
                      Theme.of(context).colorScheme.surface.withOpacity(0.9),
                      Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                    ],
                    stops: [0.0, 0.7, 1.0],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    // Enhanced divider with animated gradient
                    TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 2000),
                      tween: Tween(begin: 0.0, end: 1.0),
                      curve: Curves.easeInOut,
                      builder: (context, value, child) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          height: 2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4 * value),
                                Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.6 * value),
                                Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4 * value),
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(1),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 22.5),

                    // Enhanced current location with glass morphism effect
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.9),
                            Theme.of(context)
                                .colorScheme
                                .tertiary
                                .withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.15),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: MyCurrentLocation(),
                    ),

                    SizedBox(height: 10),

                    // Enhanced description box with better styling
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.9),
                            Theme.of(context)
                                .colorScheme
                                .tertiary
                                .withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.15),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: MyDescriptionBox(),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
              title: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.surface.withOpacity(0.95),
                      Theme.of(context).colorScheme.surface.withOpacity(0.9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      blurRadius: 15,
                      offset: Offset(0, 5),
                      spreadRadius: 2,
                    ),
                  ],
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: MyTabBar(tabController: _tabController),
              ),
            ),
          ],
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.surface.withOpacity(0.8),
                  Theme.of(context).colorScheme.surface.withOpacity(0.95),
                ],
              ),
            ),
            child: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                physics: BouncingScrollPhysics(),
                children: getFoodInThisCategory(restaurant.menu),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
