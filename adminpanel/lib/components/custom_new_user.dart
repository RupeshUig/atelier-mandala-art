import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adminpanel/components/custom_button.dart';
import 'package:adminpanel/constants/constants.dart';

Widget customNewUserCard(
  textUser,
  EnrolledCourse,
  image,
  BuildContext context,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        // border:
        //     Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
        // borderRadius: BorderRadius.circular(10),
      ),
      // height: screenHeight * 0.22,
      width: screenWidth * 0.9,
      // onTap: function,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.015,
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.03),
              Container(
                height: screenHeight * 0.068,
                width: screenWidth * 0.14,
                decoration: BoxDecoration(
                    boxShadow: [
                      // BoxShadow(color: Colors.grey.shade300, blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: primaryColor)
                    // color: additionalDarkBlueLight,
                    ),
                child: Image.asset(
                  image,
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
                    " ${textUser}",
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontSize: 18,
                      // fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.007,
                  ),
                  Text(
                    "Enrolled Course: ${EnrolledCourse}",
                    style: GoogleFonts.urbanist(
                      color: const Color.fromARGB(164, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          )),
          SizedBox(
            height: screenHeight * 0.018,
          ),
        ],
      ));
}
