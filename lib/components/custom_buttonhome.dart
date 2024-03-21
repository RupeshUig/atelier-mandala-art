import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uig/constants/constants.dart';

class CustomButtonHome extends StatelessWidget {
  void Function()? function;
  Color color;
  Color textColor;
  String text;
  CustomButtonHome(
      {super.key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.function});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      radius: 2,
      onTap: function,
      child:  Container(
          height: screenHeight * 0.06,
          width: screenWidth * 0.25,
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey.shade300)],
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.dmSans(
                color: textColor,
                fontSize: 12,
              ),
            ),
          ),
        ),
      
    );
  }
}
