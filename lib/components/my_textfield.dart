import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  bool _isFocused = false;
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            _isFocused = hasFocus;
          });
        },
        child: TextField(
          controller: widget.controller,
          obscureText: _isObscured,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey[800],
          ),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: GoogleFonts.poppins(
              color: _isFocused
                  ? Theme.of(context).primaryColor
                  : Colors.grey[800],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey[800],
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null,
            prefixIcon: Icon(
              widget.label.toLowerCase().contains('email')
                  ? Icons.email_outlined
                  : widget.label.toLowerCase().contains('password')
                      ? Icons.lock_outline
                      : Icons.person_outline,
              color: _isFocused
                  ? Theme.of(context).primaryColor
                  : Colors.grey[800],
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
