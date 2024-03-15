import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:uig/components/custom_button.dart';
import 'package:uig/constants/constants.dart';
import 'package:uig/screens/authentication_screens/reset_password.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  int _timerCount = 20;
  Timer? _timer;
  Widget continueAlias = Container();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerCount > 0) {
          _timerCount--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void resendOtp() {
    // Implement your logic to resend OTP
    setState(() {
      _timerCount = 20;
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Change Password",
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
                "Authentication code",
                style: headingH1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "We have sent a verification code to your mail rupeshyadav78857@gmail.com",
                style: GoogleFonts.dmSans(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 50,
              ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 60,
                otpFieldStyle: OtpFieldStyle(
                    backgroundColor: backgroundColor,
                    focusBorderColor: primaryColor,
                    errorBorderColor: Colors.red),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  setState(() {
                    continueAlias = CustomButton(
                      text: "Continue",
                      color: primaryColor,
                      textColor: Colors.white,
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetPassword(),
                            ));
                      },
                    );
                  });
                  print("Completed: " + pin);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              continueAlias,
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (_timerCount > 0)
                        ? Text(
                            'Resend OTP in $_timerCount seconds',
                            style: GoogleFonts.dmSans(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        : TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "I didn't recieve the code  ",
                                  style:
                                      GoogleFonts.dmSans(color: Colors.black),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    resendOtp();
                                  },
                                  child: Text(
                                    "Resend",
                                    style: GoogleFonts.dmSans(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
