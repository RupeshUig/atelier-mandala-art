import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adminpanel/components/custom_button.dart';
import 'package:adminpanel/constants/constants.dart';

Widget customDashboardTile(
  totalCount,
  image,
  textcategory,
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
              // Border.all(width: 0.0, color: const Color.fromARGB(30, 0, 0, 0)),
              Border.all(width: 0.0, color: Colors.transparent),
          // color: const Color.fromARGB(55, 255, 255, 255),
          color: Colors.white),
      height: screenHeight * 0.4,
      width: screenWidth * 0.3,
      // onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   height: screenHeight * 0.18,
            //   width: screenWidth * 0.4,
            //   decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(color: Colors.grey.shade300, blurRadius: 12)
            //     ],
            //     borderRadius: BorderRadius.circular(12),
            //     // color: color,
            //   ),
            SizedBox(
              height: screenHeight * 0.006,
            ),
            Image.asset(
              "lib/assets/logo/total_user.png",
              scale: 4.5,
              // fit: BoxFit.fill,
            ),
            // ),
            SizedBox(
              height: screenHeight * 0.006,
            ),
            Text(
              textcategory,
              style: GoogleFonts.dmSans(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.001,
            ),
            Text(
              totalCount,
              style: GoogleFonts.dmSans(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ));
}
