import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uig/components/custom_button.dart';
import 'package:uig/constants/constants.dart';
import 'package:uig/screens/authentication_screens/create_account.dart';
import 'package:uig/screens/authentication_screens/emailOTPVerification.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: headingH3,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Please enter you email",
                style: headingH1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "We will send you a confirmation email",
                style: GoogleFonts.dmSans(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Email Address",
                style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
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
                height: 30,
              ),
              CustomButton(
                text: "Continue",
                color: primaryColor,
                textColor: Colors.white,
                function: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OTPVerification(),
                      ));
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

  
}
