import 'package:adminpanel/components/custom_course_card.dart';
import 'package:adminpanel/components/custom_latest_purchase_card.dart';
import 'package:adminpanel/components/custom_new_user.dart';
import 'package:adminpanel/components/dashboard_tile.dart';
import 'package:adminpanel/constants/constants.dart';
import 'package:adminpanel/screens/login_screen.dart';
import 'package:adminpanel/screens/workshops/manage_workshops.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class coursePage extends StatefulWidget {
  const coursePage({super.key});

  @override
  State<coursePage> createState() => _coursePageState();
}

class _coursePageState extends State<coursePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          "Course",
          // textAlign: TextAlign.left,
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: screenWidth * 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                          // prefixIcon: const Icon(Icons.search_rounded),
                          suffixIcon: const Icon(
                            Icons.search_rounded,
                            color: Colors.orange,
                            size: 29,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          labelText: "Search",
                          border: OutlineInputBorder(
                              // borderSide: BorderSide(
                              //   // color: dividerColor,
                              //   width: 0,
                              // ),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(
                      //       // color: Colors.grey.shade600,
                      //     ))
                      // ,
                      child: Icon(
                        Icons.filter_alt_outlined,
                        // color: Colors.grey.shade600,
                        color: primaryColor,
                        size: 32,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              customCoursesCard('324', "lib/assets/logo/course_img.png", "Free",
                  "Data and Data scien", context),
              customCoursesCard('324', "lib/assets/logo/course_img.png", "Free",
                  "Data and Data scien", context),
              customCoursesCard('324', "lib/assets/logo/course_img.png", "Free",
                  "Data and Data scien", context)
            ],
          ),
        ),
      ),
    );
  }
}
