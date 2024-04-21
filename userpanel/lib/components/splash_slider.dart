import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:userpanel/constants/constants.dart';

class IntroScreenDefaultState extends StatefulWidget {
  const IntroScreenDefaultState({super.key});

  @override
  State<IntroScreenDefaultState> createState() =>
      _IntroScreenDefaultStateState();
}

class _IntroScreenDefaultStateState extends State<IntroScreenDefaultState> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      ContentConfig(
        backgroundImage: "lib/assets/splash1.png",
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0.000,
        marginTitle: EdgeInsets.only(bottom: 0),
        description: "Hello whaterver",
        widgetDescription: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
              child: Text(
                "Explore a world of possibillities with events at your fingertips",
                style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
    listContentConfig.add(
      ContentConfig(
        backgroundImage: "lib/assets/splash2.png",
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0.000,
        marginTitle: EdgeInsets.only(bottom: 0),
        widgetDescription: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Center(
              child: Text(
                "Meet new people and discover new opportunities with us",
                style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
    listContentConfig.add(
      ContentConfig(
        backgroundImage: "lib/assets/splash3.png",
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0.000,
        marginTitle: EdgeInsets.only(bottom: 0),
        heightImage: 200,
        widgetDescription: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
              child: Text(
                "",
                style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onDonePress() {}

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllTabs: Colors.white,
      // isScrollable: false,
      
      curveScroll: Curves.easeInOut,
      isShowDoneBtn: false,
      isShowNextBtn: false,
      isShowSkipBtn: false,
      isShowPrevBtn: false,
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
    );
  }
}
