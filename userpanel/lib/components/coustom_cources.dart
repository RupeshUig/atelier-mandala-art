import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userpanel/components/custom_button.dart';
import 'package:userpanel/components/custom_buttoncard.dart';
import 'package:userpanel/constants/constants.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
      ),
      // height: screenHeight * 0.21,
      width: screenWidth * 0.9,
      // onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.205,
              width: screenWidth * 0.4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 12)
                ],
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
              child: Image.asset(
                'lib/assets/Card.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.03,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textcategory,
                    style: GoogleFonts.urbanist(
                      color: textColorfade,
                      fontSize: 16,
                    ),
                  ),
                  // SizedBox(
                  //   height: screenHeight * 0.001,
                  // ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth:
                          screenWidth * 0.38, // Set your maximum width here
                    ),
                    child: Text(
                      textcoursename,
                      style: GoogleFonts.urbanist(
                        color: textColorbold,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: screenHeight * 0.009,
                  // ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      textrating,
                      style: GoogleFonts.urbanist(
                        color: textColorbold,
                        fontSize: 16,
                      ),
                    ),
                    // SizedBox(
                    //   width: screenWidth * 0.008,
                    // ),
                    // icon of star and review will be used if needed ...........
                    // Icon(
                    //   Icons.star,
                    //   color: Colors.yellow,
                    //   size: 20.0,
                    // ),
                    // SizedBox(
                    //   width: screenWidth * 0.01,
                    // ),
                    // Text(
                    //   textViews,
                    //   style: GoogleFonts.urbanist(
                    //     color: textColorfade,
                    //     fontSize: 16,
                    //   ),
                    // ),
                  ]),
                  // SizedBox(
                  //   width: screenWidth * 0.1,
                  // ),
                  // SizedBox(
                  //   height: screenHeight * 0.005,
                  // ),
                  CustomCardButton(
                      text: "Free",
                      color: Colors.purple.shade50,
                      textColor: additionalDarkBlue,
                      width: 0.18,
                      function: () {}),
                ]),
          ],
        ),
      ));
}
