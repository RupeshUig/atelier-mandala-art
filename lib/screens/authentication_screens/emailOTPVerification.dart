import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
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
                            ),
                          ),
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
