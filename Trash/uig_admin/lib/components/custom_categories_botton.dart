import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uig_admin/constants/constants.dart';

class CustomCategoriesButton extends StatelessWidget {
  void Function()? function;
  Color color;
  Color textColor;
  String text;

  CustomCategoriesButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      radius: 2,
      onTap: function,
      child: Container(
        height: screenHeight * 0.060,
        width: screenWidth * 0.35,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.shade100)],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(14),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}