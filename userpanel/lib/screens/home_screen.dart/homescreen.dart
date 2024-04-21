import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userpanel/components/coustom_cources.dart';
import 'package:userpanel/components/custom_buttonhome.dart';
import 'package:userpanel/components/custom_categories_button.dart';
import 'package:userpanel/components/custom_upcoming_card.dart';
import 'package:userpanel/components/homescreen/filter_chips.dart';
import 'package:userpanel/components/homescreen/top_rated.dart';
import 'package:userpanel/components/homescreen/upcoming_item.dart';
import 'package:userpanel/constants/constants.dart';
import 'package:userpanel/components/custom_instructor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCategoriesButton(
                  text: "Workshop",
                  color: primaryColor,
                  textColor: Colors.white,
                  function: () {},
                ),
                CustomCategoriesButton(
                  text: "E-Store",
                  color: Colors.white10,
                  textColor: Colors.black,
                  function: () {},
                ),
                // SizedBox.expand()
                SizedBox(
                  width: 35,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          prefixIcon: const Icon(Icons.search_rounded),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          labelText: "Search for a Workshop",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: dividerColor,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade600,
                          )),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.grey.shade600,
                      ),
                    )
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
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.urbanist(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 5,
                children: [
                  CategoryChip(
                    text: "Cooking",
                    onTap: () {},
                  ),
                  CategoryChip(
                    text: "Language Learning",
                    onTap: () {},
                  ),
                  CategoryChip(
                    text: "Art",
                    onTap: () {},
                  ),
                  CategoryChip(
                    text: "Fitness",
                    onTap: () {},
                  ),
                  CategoryChip(
                    text: "DIY/Craft",
                    onTap: () {},
                  ),
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
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.urbanist(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                height: screenHeight * 0.35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    UpcomingItem(),
                    UpcomingItem(),
                    UpcomingItem(),
                    UpcomingItem(),
                    UpcomingItem(),
                    UpcomingItem(),
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
                    "Top Rated",
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.urbanist(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 5, // Spacing between columns
                  mainAxisSpacing: 5, // Spacing between rows
                  childAspectRatio: 1 / 1.6,
                ),
                itemCount: 4, // Number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  // Return a widget for each item
                  return TopRated(
                      category: "Course",
                      image: "lib/assets/figma.png",
                      price: 159,
                      rating: 4.2,
                      title: "Figma Course");
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Instructors",
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.urbanist(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Number of columns
                  crossAxisSpacing: 0, // Spacing between columns
                  mainAxisSpacing: 5, // Spacing between rows
                  childAspectRatio: 1 / 0.59,
                ),
                itemCount: 2, // Number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  // Return a widget for each item
                  return customInstructorCard(
                      Colors.white,
                      Colors.black,
                      Colors.grey.shade500,
                      "English teacher",
                      "5/5",
                      "12 400",
                      "6",
                      " Lina Kovalenko",
                      context);
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Free Courses",
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.urbanist(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Number of columns
                  crossAxisSpacing: 0, // Spacing between columns
                  mainAxisSpacing: 5, // Spacing between rows
                  childAspectRatio: 1 / 0.61,
                ),
                itemCount: 2, // Number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  // Return a widget for each item
                  return customCoursesCard(
                      const Color.fromARGB(45, 0, 0, 0),
                      additionalBlueLight,
                      Colors.black,
                      Colors.grey.shade500,
                      "Design",
                      "5/5",
                      '150',
                      "98 reviews",
                      "Figma course design",
                      context);
                },
              ),
              // const SizedBox(
              //   height: 50,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.deepPurpleAccent,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded), label: "My Courses"),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_library_books_rounded), label: "Library"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Account"),
          ]),
    );
  }
}
