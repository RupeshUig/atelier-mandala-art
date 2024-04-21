import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingItem extends StatelessWidget {
  const UpcomingItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.8,
      height: screenHeight * 0.1,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth * 0.75,
            height: screenHeight * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("lib/assets/upcoming.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Cooking",
            style: GoogleFonts.urbanist(color: Colors.grey.shade500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rating 4.4",
                style: GoogleFonts.urbanist(),
              ),
              Text(
                "\$139.00",
                style: GoogleFonts.urbanist(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Aloo Parathas",
                style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 196, 236),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Enroll Now',
                    style: GoogleFonts.urbanist(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
