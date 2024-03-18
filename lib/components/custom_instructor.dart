import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uig/components/custom_button.dart';
import 'package:uig/components/custom_instruct_details_card.dart';
import 'package:uig/constants/constants.dart';

Widget customInstructorCard(
  color,
  // Color textColor;
  // textColorprice,
  textColorbold,
  textColorfade,
  textDomain,
  textrating,
  textenroll,
  textCourses,
  textInstructName,
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
        color: color,
      ),
      height: screenHeight * 0.22,
      width: screenWidth * 0.9,
      // onTap: function,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.04,
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.11),
              Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.165,
                decoration: BoxDecoration(
                    boxShadow: [
                      // BoxShadow(color: Colors.grey.shade300, blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: additionalDarkBlueLight)
                    // color: additionalDarkBlueLight,
                    ),
                child: Image.asset(
                  'lib/assets/instructorImage.png',
                  scale: 3,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: screenWidth * 0.05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textInstructName,
                    style: GoogleFonts.dmSans(
                      color: textColorbold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    textDomain,
                    style: GoogleFonts.dmSans(
                      color: textColorfade,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          )),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          customInstructDetails(Colors.white, textrating, Colors.black,
              textCourses, textenroll, context)
        ],
      ));
}
