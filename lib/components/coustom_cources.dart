import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uig/components/custom_button.dart';
import 'package:uig/components/custom_buttoncard.dart';
import 'package:uig/constants/constants.dart';

Widget customCoursesCard(
  color,
  // Color textColor;
  textColorprice,
  textColorbold,
  textColorfade,
  textcategory,
  textrating,
  textPrice,
  textViews,
  textcoursename,
  BuildContext context,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Container(
      decoration: BoxDecoration(
        boxShadow: [
          // BoxShadow(color: Colors.grey.shade300, blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(5),
        border:
            Border.all(width: 0.5, color: const Color.fromARGB(30, 0, 0, 0)),
        color: Colors.white,
      ),
      height: screenHeight * 0.21,
      width: screenWidth * 0.9,
      // onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.18,
              width: screenWidth * 0.4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 12)
                ],
                borderRadius: BorderRadius.circular(12),
                color: color,
              ),
              child: Image.asset(
                'lib/assets/upcomingCategory.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.03,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textcategory,
                    style: GoogleFonts.dmSans(
                      color: textColorfade,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.001,
                  ),
                  Text(
                    textcoursename,
                    style: GoogleFonts.dmSans(
                      color: textColorbold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.009,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      textrating,
                      style: GoogleFonts.dmSans(
                        color: textColorbold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.008,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    Text(
                      textViews,
                      style: GoogleFonts.dmSans(
                        color: textColorfade,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                  SizedBox(
                    width: screenWidth * 0.1,
                  ),
                  CustomCardButton(
                      text: "Free",
                      color: const Color.fromARGB(44, 33, 149, 243),
                      textColor: additionalDarkBlue,
                      width: 0.18,
                      function: () {}),
                ]),
          ],
        ),
      ));
}
