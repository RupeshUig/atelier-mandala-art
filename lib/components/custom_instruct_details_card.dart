import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uig/components/custom_button.dart';
import 'package:uig/constants/constants.dart';

Widget customInstructDetails(
  color,
  // Color textColor;
  // textColorprice,
  textRating,
  textColorbold,
  textCourseName,
  textValue,
  BuildContext context,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            // BoxShadow(color: Colors.grey.shade300, blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
          // border:
          // Border.all(width: 0.5, color: const Color.fromARGB(30, 0, 0, 0)),
          color: Color.fromARGB(22, 158, 158, 158),
        ),
        height: screenHeight * 0.05,
        width: screenWidth * 0.9,
        // onTap: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              color: additionalBlueLight,
              size: 25.0,
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Text(
              "+${textValue}",
              style: GoogleFonts.dmSans(
                color: textColorbold,
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Icon(
              Icons.blinds_closed,
              color: additionalBlueLight,
              size: 25.0,
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Text(
              "${textCourseName} courses",
              style: GoogleFonts.dmSans(
                color: textColorbold,
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Icon(
              Icons.star_border_purple500_outlined,
              color: additionalBlueLight,
              size: 25.0,
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            Text(
              "${textRating} rating",
              style: GoogleFonts.dmSans(
                color: textColorbold,
                fontSize: 14,
              ),
            )
          ],
        )),
  );
}
