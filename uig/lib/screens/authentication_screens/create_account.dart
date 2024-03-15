import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uig/components/custom_button.dart';
import 'package:uig/constants/constants.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          height: 350,
          child:  Center(
            child: Column(
              children: [
                Text(
                  'Terms and Conditions!',
                  style: headingH3,
                ),
                ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text('Lorem ipsum dolor sit amet'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text('Consectetur adipiscing elit'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text('Sed do eiusmod tempor incididunt'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text('Ut labore et dolore magna aliqua'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool _isChecked = true;
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
                "Create an Account",
                style: headingH1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "We are happy to welcome you to this platform",
                style: GoogleFonts.dmSans(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Full Name",
                style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Full Name",
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
                "Email Adress",
                style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey.shade500,
                  ),
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
                "Password",
                style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey.shade500,
                  ),
                  hintText: "Password",
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
              Row(
                children: [
                  Material(
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        print("hello");
                        _showBottomSheet(context);
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                  ),
                  Text.rich(TextSpan(style: GoogleFonts.dmSans(), children: [
                    TextSpan(
                        text: 'By creating an account, you agree to our\n'),
                    TextSpan(
                        text: 'Term and Conditions',
                        style: GoogleFonts.dmSans(
                            color: primaryColor, fontWeight: FontWeight.w600)),
                  ]))
                ],
              ),
              CustomButton(
                text: "Create Account",
                color: primaryColor,
                textColor: Colors.white,
                function: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or login with",
                        style: GoogleFonts.dmSans(color: Colors.black)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconContainer(
                    Icons.facebook,
                  ),
                  IconContainer(
                    Icons.gamepad,
                  ),
                  IconContainer(
                    Icons.apple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: GoogleFonts.dmSans(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
            Text(
              "Sign up here ",
              style: GoogleFonts.dmSans(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget IconContainer(IconData icon) {
    return Container(
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
      child: Center(
        child: Icon(
          icon, // Replace with Google icon
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
