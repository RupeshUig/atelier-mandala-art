import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userpanel/components/custom_button.dart';
import 'package:userpanel/components/custom_instruct_details_card.dart';
import 'package:userpanel/constants/constants.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
      ),
      // height: screenHeight * 0.22,
      width: screenWidth * 0.9,
      // onTap: function,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.06),
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
                width: screenWidth * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenHeight * 0.006,
                  ),
                  Text(
                    textInstructName,
                    style: GoogleFonts.urbanist(
                      color: textColorbold,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    textDomain,
                    style: GoogleFonts.urbanist(
                      color: textColorfade,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          )),
          SizedBox(
            height: screenHeight * 0.018,
          ),
          customInstructDetails(Colors.white, textrating, Colors.black,
              textCourses, textenroll, context),
          const SizedBox(
            height: 15,
          ),
        ],
      ));
}
