// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';
import 'package:food_delivery/services/auth/auth_service.dart';
import 'package:lottie/lottie.dart';

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

  //register method
  void register() async {
    //get the auth service
    final _authService = AuthService();

    //check if passwords match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      //try creating user
      try {
        await _authService.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
      }
      //display errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    //if passwords don't match -> throw error
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Paswords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Lottie.asset(
              'assets/animations/background.json',
              fit: BoxFit.cover,
              repeat: true,
              animate: true,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //zwiggy logo

                  Image.asset(
                    'assets/logos/zwiggy.png',
                    height: 100,
                  ),
                  SizedBox(height: 50),

                  //message, app slogan
                  Text(
                    "REGISTER",
                    style: TextStyle(
                      fontSize: 26,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  SizedBox(height: 15),

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
                  MyButton(onTap: register, text: "Sign Up"),

                  //not a member? register now
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Already a member?  ",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
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
          ],
        ));
  }
}
