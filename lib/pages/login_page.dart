// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/services/auth/auth_service.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login function
  void login() async {
    //get instance of auth service
    final _authService = AuthService();

    //try sign in
    try {
      await _authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    }

    //display errors if any
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  //forgot password function
  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text("User tapped forgot password."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
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
                    "LOGIN",
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

                  //sign in button
                  MyButton(onTap: login, text: "Sign in"),

                  //not a member? register now
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Not a member?  ",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Register now",
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
