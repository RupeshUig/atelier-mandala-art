import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customCoursesCard(
  enrolled,
  image,
  paymentStatus,
  textCourse,
  BuildContext context,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.transparent, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
      ),
      width: screenWidth * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.12,
              width: screenWidth * 0.3,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent),
              child: Image.asset(
                image,
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
                    textCourse,
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.004,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${enrolled} People Enrolled",
                        style: GoogleFonts.urbanist(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          paymentStatus,
                          style: GoogleFonts.urbanist(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.004,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.2,
                      ),
                      IconButton(
                        iconSize: 27,
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.orange,
                        ),
                        onPressed: () {
                          // ...
                        },
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      IconButton(
                        iconSize: 27,
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // ...
                        },
                      ),
                    ],
                  ),
                  // ),
                ]),
          ],
        ),
      ));
}
