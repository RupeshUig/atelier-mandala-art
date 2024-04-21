import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userpanel/components/custom_button.dart';
import 'package:userpanel/components/splash_slider.dart';
import 'package:userpanel/constants/constants.dart';
import 'package:userpanel/screens/authentication_screens/create_account.dart';
import 'package:userpanel/screens/authentication_screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   actions: [
      //     TextButton(
      //       onPressed: () {},
      //       child:
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Text(
                          "Skip",
                          style: GoogleFonts.dmSans(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: IntroScreenDefaultState(),
                ),
                // CustomButton(
                //   text: "Register",
                //   color: primaryColor,
                //   textColor: Colors.white,
                //   function: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const CreateAccountScreen(),
                //         ));
                //   },
                // ),T
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                Text("Welcome", style: headingH2),
                CustomButton(
                  text: "Get Started",
                  color: primaryColor,
                  textColor: Colors.white,
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
