import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.symmetric(horizontal: 67),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(100, 153, 233, 1.0),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        )),
      ),
    );
  }
}
