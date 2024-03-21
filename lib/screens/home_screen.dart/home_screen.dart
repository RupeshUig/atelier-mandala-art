import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uig/components/coustom_cources.dart';
import 'package:uig/components/custom_instructor.dart';
import 'package:uig/components/custom_toprated_card.dart';
import 'package:uig/components/custom_upcoming_card.dart';
import 'package:uig/components/custom_categories_button.dart';
import 'package:uig/constants/constants.dart';
import 'package:uig/components/custom_buttonhome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Logged In"),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCategoriesButton(
                            text: "Workshop",
                            color: additionalBlueLight,
                            textColor: Colors.white,
                            function: () {}),
                        CustomCategoriesButton(
                            text: "E-Store",
                            color: Colors.white10,
                            textColor: Colors.black,
                            function: () {}),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.dmSans(
                          color: const Color.fromARGB(52, 0, 0, 0),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonHome(
                          text: "  cooking  ",
                          color: Colors.purple.shade50,
                          textColor: Colors.deepPurple,
                          function: () {}),
                      CustomButtonHome(
                          text: "  Language Learning  ",
                          color: Colors.pink.shade50,
                          textColor: Colors.pink,
                          function: () {}),
                      CustomButtonHome(
                          text: "  art  ",
                          color: Colors.yellow.shade50,
                          textColor: Colors.yellow,
                          function: () {}),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming",
                        style: GoogleFonts.dmSans(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.dmSans(
                          color: const Color.fromARGB(52, 0, 0, 0),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    height: screenHeight * 0.355,
                    width: screenWidth, // Adjust height as needed
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.9,
                            child: categoryUpcomingCard(
                                Colors.white,
                                additionalBlueLight,
                                Colors.black,
                                const Color.fromARGB(38, 0, 0, 0),
                                "Cooking",
                                "5/5",
                                "139.00",
                                "98",
                                "Aaloo Paranthas",
                                context),
                          ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: categoryUpcomingCard(
                              Colors.white,
                              additionalBlueLight,
                              Colors.black,
                              const Color.fromARGB(38, 0, 0, 0),
                              "Cooking",
                              "5/5",
                              "139",
                              "98",
                              "Aaloo Paranthas",
                              context),
                        ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: categoryUpcomingCard(
                              Colors.white,
                              additionalBlueLight,
                              Colors.black,
                              const Color.fromARGB(38, 0, 0, 0),
                              "Cooking",
                              "5/5",
                              "139",
                              "98",
                              "Aaloo Paranthas",
                              context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Rated",
                        style: GoogleFonts.dmSans(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.dmSans(
                          color: const Color.fromARGB(52, 0, 0, 0),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTopRatedCard(
                          const Color.fromARGB(45, 0, 0, 0),
                          additionalBlueLight,
                          Colors.black,
                          Color.fromARGB(52, 0, 0, 0),
                          "Design",
                          "5/5",
                          '150.00',
                          "98",
                          "Figma course",
                          context),
                      customTopRatedCard(
                          const Color.fromARGB(45, 0, 0, 0),
                          additionalBlueLight,
                          Colors.black,
                          Color.fromARGB(52, 0, 0, 0),
                          "Design",
                          "5/5",
                          '150.00',
                          "98",
                          "Figma course",
                          context),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Instructors",
                        style: GoogleFonts.dmSans(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.dmSans(
                          color: const Color.fromARGB(52, 0, 0, 0),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  customInstructorCard(
                      Colors.white,
                      Colors.black,
                      Color.fromARGB(63, 0, 0, 0),
                      "English teacher",
                      "5/5",
                      "12 400",
                      "6",
                      "Lina Kovalenko",
                      context),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free courses",
                        style: GoogleFonts.dmSans(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.dmSans(
                          color: const Color.fromARGB(52, 0, 0, 0),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  customCoursesCard(
                      const Color.fromARGB(45, 0, 0, 0),
                      additionalBlueLight,
                      Colors.black,
                      Color.fromARGB(52, 0, 0, 0),
                      "Design",
                      "5/5",
                      '150',
                      "98 reviews",
                      "Figma course",
                      context)
                ]),
          ),
        ),
      ),
    );
  }
}
