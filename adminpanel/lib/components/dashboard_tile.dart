import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adminpanel/components/custom_button.dart';
import 'package:adminpanel/constants/constants.dart';

Widget customDashboardTile(
  // Icon icon,
  totalCount,
  image,
  textcategory,
  BuildContext context,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return
      // Card.outlined(
      // elevation: 2,
      Container(
          decoration: BoxDecoration(
              // boxShadow: [],
              borderRadius: BorderRadius.circular(10),
              border:
                  // Border.all(width: 0.0, color: const Color.fromARGB(30, 0, 0, 0)),
                  Border.all(width: 0.0, color: Colors.transparent),
              // color: const Color.fromARGB(55, 255, 255, 255),
              color: Colors.white),
          height: screenHeight * 0.4,
          width: screenWidth * 0.3,
          // onTap: function,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                // icon,
                // ),
                Image.asset(
                  image,
                  scale: 4.5,
                ),
                SizedBox(
                  height: screenHeight * 0.006,
                ),
                Text(
                  textcategory,
                  style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
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
            // )),
          ));
}
