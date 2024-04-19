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
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Admin Dashboard",
          style: GoogleFonts.poppins(fontSize: 22),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 247, 230, 209),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset("lib/assets/logo/splash_logo.png"),
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
            const SizedBox(height: 160),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text("Signed In as \n ${user!.email}"),
            )
          ],
        ),
      ),
    );
  }
}
