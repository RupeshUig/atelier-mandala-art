import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uig/components/custom_button.dart';
import 'package:uig/components/custom_buttoncard.dart';
import 'package:uig/constants/constants.dart';

Widget categoryUpcomingCard(
  color,
  textColorprice,
  textColorbold,
  textColorfade,
  textcategory,
  textrating,
  textPrice,
  textViews,
  textItem,
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
        color: const Color.fromARGB(55, 255, 255, 255),
      ),
      height: screenHeight * 0.3,
      width: screenWidth * 0.9,
      // onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.001,
            ),
            Container(
              height: screenHeight * 0.2,
              width: screenWidth * 0.85,
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
              height: screenHeight * 0.001,
            ),
            Text(
              textcategory,
              style: GoogleFonts.dmSans(
                color: textColorfade,
                fontSize: 18,
              ),
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
                width: screenWidth * 0.01,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20.0,
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Text(
                textViews,
                style: GoogleFonts.dmSans(
                  color: textColorfade,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: screenWidth * 0.46,
              ),
              Text(
                textPrice,
                style: GoogleFonts.dmSans(
                  color: textColorprice,
                  fontSize: 18,
                ),
              ),
            ]),
            // SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${textItem}",
                  style: GoogleFonts.dmSans(
                    color: textColorbold,
                    fontSize: 18,
                  ),
                ),
                CustomCardButton(
                    text: "Enroll Now",
                    color: Color.fromARGB(44, 33, 128, 243),
                    textColor: additionalDarkBlue,
                    width: 0.3,
                    function: () {}),
              ],
            ),
          ],
        ),
      ));
}
