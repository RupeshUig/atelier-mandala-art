import 'package:adminpanel/components/custom_latest_purchase_card.dart';
import 'package:adminpanel/components/custom_new_user.dart';
import 'package:adminpanel/components/dashboard_tile.dart';
import 'package:adminpanel/constants/constants.dart';
import 'package:adminpanel/screens/course.dart';
import 'package:adminpanel/screens/login_screen.dart';
import 'package:adminpanel/screens/workshops/manage_workshops.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Admin Dashboard",
          style: GoogleFonts.poppins(
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.64,
                // child: Expanded(
                child: GridView.count(
                  primary: false,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    customDashboardTile(
                        // Icon(
                        //   Icons.verified_user_outlined,
                        //   color: Colors.orange,
                        // ),
                        "457",
                        "lib/assets/logo/total_user.png",
                        "Total User",
                        context),
                    customDashboardTile(
                        // Icon(
                        //   Icons.download_outlined,
                        //   color: Colors.orange,
                        // ),
                        "457",
                        "lib/assets/logo/enrolled.png",
                        "Total Enrolled",
                        context),
                    customDashboardTile(
                        // Icon(
                        //   Icons.person_add_alt_outlined,
                        //   color: Colors.orange,
                        // ),
                        "457",
                        "lib/assets/logo/subscriber.png",
                        "Total Subscriber",
                        context),
                    customDashboardTile(
                        // Icon(
                        //   Icons.event_available_outlined,
                        //   color: Colors.orange,
                        // ),
                        "457",
                        "lib/assets/logo/purchase.png",
                        "Total Purchase",
                        context),
                    customDashboardTile(
                        // Icon(
                        //   Icons.event_available_outlined,
                        //   color: Colors.orange,
                        // ),
                        "457",
                        "lib/assets/logo/events.png",
                        "Total Events",
                        context),
                    customDashboardTile(
                        // Icon(
                        //   Icons.event_available_outlined,
                        //   color: Colors.orange,
                        // ),
                        "457",
                        "lib/assets/logo/notification.png",
                        "Total Notification",
                        context),
                  ],
                ),
                // ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New User",
                    style: GoogleFonts.dmSans(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.dmSans(
                      color: primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              //............add New user card or call list ..................//
              customNewUserCard("Courtney Henry", "1",
                  "lib/assets/logo/new_user.png", context),
              customNewUserCard("Courtney Henry", "1",
                  "lib/assets/logo/new_user.png", context),
              customNewUserCard("Courtney Henry", "1",
                  "lib/assets/logo/new_user.png", context),
              customNewUserCard("Courtney Henry", "1",
                  "lib/assets/logo/new_user.png", context),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Purchases",
                    style: GoogleFonts.dmSans(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.dmSans(
                      color: primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              //..................add latest purchase or call list of coustomPurchaseCard.............//
              customPurchaseCard('Event Name', "Wade Warren", '299', context),
              customPurchaseCard('Event Name', "Wade Warren", '299', context),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Image.asset(
                    "lib/assets/logo/splash_logo.png",
                    height: screenHeight * 0.06,
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  Text(
                    "Atelier Mandala.",
                    style: headingH3,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Divider(),
            ListTile(
              leading: Image.asset(
                "lib/assets/logo/mage_dashboard.png",
                scale: 4.5,
              ),
              title: const Text(
                'Dashboard',
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              leading: Image.asset(
                "lib/assets/logo/course.png",
                scale: 4.5,
              ),
              title: const Text('Course'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Course()));
              },
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/logo/user.png",
                scale: 4.5,
              ),
              title: const Text('User'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                "lib/assets/logo/payment.png",
                scale: 4.5,
              ),
              title: const Text('Payments'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/logo/manage_workshop.png",
                scale: 4.5,
              ),
              title: const Text('Manage Workshops'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManageWorkshops()));
              },
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/logo/take-away.png",
                scale: 4.5,
              ),
              title: const Text('Manage Takeways'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 11),
              leading: Image.asset(
                "lib/assets/logo/publish_gift_card.png",
                scale: 4.5,
              ),
              title: Row(
                children: [
                  const Text('Publish Giftcards'),
                  const Text(
                    " (Coming Soon)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
              // subtitle: const Text("Coming Soon..."),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/logo/manage_store.png",
                scale: 4.5,
              ),
              title: Row(
                children: [
                  const Text('Manage Store'),
                  const Text(
                    " (Coming Soon)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
              // subtitle: const Text("Coming Soon..."),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                "lib/assets/logo/edit.png",
                scale: 4.5,
              ),
              title: const Text('Edit Profile'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/logo/chage_password.png",
                scale: 4.5,
              ),
              title: const Text('Change Password'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/logo/logout.png",
                scale: 4.5,
              ),
              title: const Text('Logout'),
              onTap: () async {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                // Update the state of the app.
                // ...
              },
            ),

            // ........ to see the login email id ..................
            // const SizedBox(height: 5),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: Text("Signed In as \n ${user!.email}"),
            // )
          ],
        ),
      ),
    );
    // );
  }
}
