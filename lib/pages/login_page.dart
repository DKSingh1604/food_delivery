// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            //message, app slogan
            Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            SizedBox(height: 50),

            //email textfield
            MyTextfield(
              controller: emailController,
              label: "Email",
              obscureText: false,
            ),

            //password textfield
            MyTextfield(
              controller: passwordController,
              label: "Password",
              obscureText: true,
            ),

            //sign in button
            MyButton(onTap: () {}, text: "Sign in")

            //not a member? register now
          ],
        ),
      ),
    );
  }
}
