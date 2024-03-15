import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:uig/components/custom_button.dart';
import 'package:uig/components/splash_slider.dart';
import 'package:uig/constants/constants.dart';
import 'package:uig/screens/authentication_screens/create_account.dart';
import 'package:uig/screens/authentication_screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: Text(
                        "Skip",
                        style: GoogleFonts.dmSans(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: IntroScreenDefaultState(),
                ),
                CustomButton(
                  text: "Register",
                  color: primaryColor,
                  textColor: Colors.white,
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountScreen(),
                        ));
                  },
                ),
                CustomButton(
                  text: "Log In",
                  color: Colors.white,
                  textColor: primaryColor,
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
