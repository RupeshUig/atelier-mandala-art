import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adminpanel/components/custom_button.dart';
import 'package:adminpanel/constants/constants.dart';

Widget customPurchaseCard(
  textEvent,
  textInstructor,
  textPrice,
  BuildContext context,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      width: screenWidth * 0.9,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Text(
                textEvent,
                style: GoogleFonts.urbanist(
                  color: Colors.black,
                  fontSize: 22,
                  // fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                textInstructor,
                style: GoogleFonts.urbanist(
                  color: const Color.fromARGB(164, 0, 0, 0),
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.018,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "\$ ${textPrice}",
                  style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ));
}
