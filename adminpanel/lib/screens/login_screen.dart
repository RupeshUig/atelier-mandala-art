import 'package:adminpanel/components/custom_button.dart';
import 'package:adminpanel/constants/constants.dart';
import 'package:adminpanel/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// Sign in with email and password
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Signed In as $email",
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      return userCredential.user;
    } catch (e) {
      print('Failed to sign in: $e');
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Sign In failed \n $e",
        ),
      );
      throw e; // Re-throw the error for handling in the UI
    }
  }

  Future<bool> checkIfAdmin(String email) async {
    try {
      // Retrieve admin document from Firestore
      DocumentSnapshot adminDoc = await FirebaseFirestore.instance
          .collection('admin')
          .doc('admin_document')
          .get();
      // Get userId from admin document
      dynamic adminData = adminDoc.data();
      String? adminUserId = adminData?['userId'] as String?; // Cast to String?

      // Check if user's email matches admin userId
      return email == adminUserId;
    } catch (e) {
      print('Error checking if admin: $e');
      throw e; // Re-throw the error for handling in the UI
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool obsVal = true;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                "Content de te revoir",
                // skndjbd
                style: headingH1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Content de te revoir. Entrez vos identifiants pour accéder à votre compte",
                style: GoogleFonts.dmSans(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Adresse e-mail",
                style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "hello@example.com",
                  hintStyle: GoogleFonts.dmSans(
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: HexColor("#EBEBF9")),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Mot de passe",
                style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: passwordController,
                obscureText: obsVal,
                decoration: InputDecoration(
                  hintText: "Mot de passe",
                  hintStyle: GoogleFonts.dmSans(
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: HexColor("#EBEBF9")),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Mot de passe oublié?",
                    style: GoogleFonts.dmSans(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Se connecter",
                color: primaryColor,
                textColor: Colors.white,
                function: () async {
                  signInWithEmailPassword(emailController.text.trim(),
                      passwordController.text.trim());

                  // AuthController.instance.login(emailController.text.trim(),
                  //     passwordController.text.trim());
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget IconContainer(String path, Function()? function) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 60,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          ),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          // decoration: BoxDecoration(color: Colors.blue),
          child: Image.asset(
            path,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
