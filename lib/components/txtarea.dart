import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MytxtArea extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const MytxtArea({super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hint,
          hintStyle:
              GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey[500]))),
    );
  }
}
