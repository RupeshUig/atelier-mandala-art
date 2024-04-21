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
              SizedBox(
                height: screenHeight * 0.45,
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
                        "457",
                        "adminpanel/lib/assets/logo/total_user.png",
                        "Total User",
                        context),
                    customDashboardTile(
                        "457",
                        "adminpanel/lib/assets/logo/total_user.png",
                        "Total User",
                        context),
                    customDashboardTile(
                        "457",
                        "adminpanel/lib/assets/logo/total_user.png",
                        "Total User",
                        context),
                    customDashboardTile(
                        "457",
                        "adminpanel/lib/assets/logo/total_user.png",
                        "Total User",
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
        backgroundColor: Color.fromARGB(255, 247, 230, 209),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              "lib/assets/logo/splash_logo.png",
              height: 100,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text('Course'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Course()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('User'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment),
              title: const Text('Payments'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
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
              leading: Icon(Icons.delivery_dining),
              title: const Text('Manage Takeways'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.wallet_giftcard),
              title: const Text('Publish Giftcards'),
              subtitle: const Text("Coming Soon..."),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: const Text('Manage Store'),
              subtitle: const Text("Coming Soon..."),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment),
              title: const Text('Edit Profile'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: const Text('Change Password'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
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
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text("Signed In as \n ${user!.email}"),
            )
          ],
        ),
      ),
    );
    // );
  }
}
