import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TxtFieldCheckout extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  const TxtFieldCheckout(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle:
              GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey[500]))),
    );
  }
}
