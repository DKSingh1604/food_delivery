import 'package:flutter/material.dart';
import 'package:food_delivery/pages/delivery_progress_page.dart';
import 'package:lottie/lottie.dart';

class DeliveryLoadingAnimationPage extends StatefulWidget {
  const DeliveryLoadingAnimationPage({super.key});

  @override
  State<DeliveryLoadingAnimationPage> createState() =>
      _DeliveryLoadingAnimationPageState();
}

class _DeliveryLoadingAnimationPageState
    extends State<DeliveryLoadingAnimationPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next page after 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DeliveryProgressPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //be on this page for 3 sec and then move to the next page

      //add my lottie animation in the center
      body: Center(
        child: Lottie.asset('assets/animations/delivery_loading.json'),
      ),
    );
  }
}
