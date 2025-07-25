// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';
import 'package:food_delivery/services/auth/auth_service.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Terms and conditions checkbox
  bool _acceptTerms = false;

  // Password strength
  String _passwordStrength = "";
  Color _passwordStrengthColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_checkPasswordStrength);
  }

  @override
  void dispose() {
    passwordController.removeListener(_checkPasswordStrength);
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength() {
    setState(() {
      String password = passwordController.text;
      if (password.isEmpty) {
        _passwordStrength = "";
        _passwordStrengthColor = Colors.grey;
      } else if (password.length < 6) {
        _passwordStrength = "Too short";
        _passwordStrengthColor = Colors.red;
      } else if (password.length < 8) {
        _passwordStrength = "Weak";
        _passwordStrengthColor = Colors.orange;
      } else if (password.contains(RegExp(r'[A-Z]')) &&
          password.contains(RegExp(r'[a-z]')) &&
          password.contains(RegExp(r'[0-9]'))) {
        _passwordStrength = "Strong";
        _passwordStrengthColor = Colors.green;
      } else {
        _passwordStrength = "Medium";
        _passwordStrengthColor = Colors.yellow[700]!;
      }
    });
  }

  //register method
  void register() async {
    //get the auth service
    final _authService = AuthService();

    // Validate inputs
    if (nameController.text.trim().isEmpty) {
      _showErrorDialog("Validation Error", "Please enter your name.",
          Icons.person_outline, Colors.orange);
      return;
    }

    if (emailController.text.trim().isEmpty) {
      _showErrorDialog("Validation Error", "Please enter your email address.",
          Icons.email_outlined, Colors.orange);
      return;
    }

    if (passwordController.text.length < 6) {
      _showErrorDialog(
          "Validation Error",
          "Password must be at least 6 characters long.",
          Icons.lock_outline,
          Colors.orange);
      return;
    }

    if (!_acceptTerms) {
      _showErrorDialog(
          "Terms Required",
          "Please accept the terms and conditions to continue.",
          Icons.description_outlined,
          Colors.orange);
      return;
    }

    //check if passwords match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      //try creating user
      try {
        await _authService.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);

        // Show success message
        _showSuccessDialog();
      }
      //display errors
      catch (e) {
        _showErrorDialog("Registration Error", e.toString(),
            Icons.error_outline, Colors.red);
      }
    }

    //if passwords don't match -> throw error
    else {
      _showErrorDialog(
          "Password Mismatch",
          "Passwords don't match! Please make sure both passwords are identical.",
          Icons.warning_amber_outlined,
          Colors.orange);
    }
  }

  void _showErrorDialog(
      String title, String message, IconData icon, Color color) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: GoogleFonts.poppins(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "OK",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 28,
            ),
            SizedBox(width: 10),
            Text(
              "Welcome!",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
        content: Text(
          "Your account has been created successfully! Welcome to Zwiggy.",
          style: GoogleFonts.poppins(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Get Started",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final screenWidth = constraints.maxWidth;

          return Stack(
            fit: StackFit.expand,
            children: [
              // Animated background
              Lottie.asset(
                'assets/animations/background.json',
                fit: BoxFit.cover,
                repeat: true,
                animate: true,
              ),

              // Gradient overlay for better text visibility
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.4),
                    ],
                  ),
                ),
              ),

              SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.05),

                        // Logo container with enhanced styling
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/logos/zwiggy.png',
                            height: screenHeight * 0.1,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        // Welcome message
                        Text(
                          "Create Account",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.08,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.01),

                        Text(
                          "Join us and start your food journey!",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w300,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.9),
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        // Registration form container
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.07),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Name field
                              MyTextfield(
                                controller: nameController,
                                label: "Name",
                                obscureText: false,
                              ),
                              SizedBox(height: screenHeight * 0.02),

                              // Email field
                              MyTextfield(
                                controller: emailController,
                                label: "Email",
                                obscureText: false,
                              ),
                              SizedBox(height: screenHeight * 0.02),

                              // Password field
                              MyTextfield(
                                controller: passwordController,
                                label: "Password",
                                obscureText: true,
                              ),
                              SizedBox(height: screenHeight * 0.01),

                              // Password strength indicator
                              if (_passwordStrength.isNotEmpty)
                                Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: passwordController.text.length /
                                            8.0,
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                _passwordStrengthColor),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      _passwordStrength,
                                      style: GoogleFonts.poppins(
                                        color: _passwordStrengthColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: screenWidth * 0.03,
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: screenHeight * 0.02),

                              // Confirm password field
                              MyTextfield(
                                controller: confirmPasswordController,
                                label: "Confirm Password",
                                obscureText: true,
                              ),
                              SizedBox(height: screenHeight * 0.02),

                              // Terms and conditions
                              Row(
                                children: [
                                  Checkbox(
                                    value: _acceptTerms,
                                    onChanged: (value) {
                                      setState(() {
                                        _acceptTerms = value!;
                                      });
                                    },
                                    activeColor: Theme.of(context).primaryColor,
                                    checkColor: Colors.white,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "I accept the terms and conditions",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.035,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.03),

                              // Sign up button
                              Container(
                                width: double.infinity,
                                height: screenHeight * 0.065,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.8),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.3),
                                      blurRadius: 15,
                                      offset: Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child:
                                    MyButton(onTap: register, text: "Sign Up"),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // Login link
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.015),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey[600],
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: Text(
                                  "Login now",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
