// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
              "Let's get started!",
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

            //confirm password textfield
            MyTextfield(
              controller: confirmPasswordController,
              label: "Confirm Password",
              obscureText: true,
            ),

            //sign in button
            MyButton(onTap: () {}, text: "Sign Up"),

            //not a member? register now
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Already a member?  "),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 2, 42, 244)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
