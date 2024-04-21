import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TopRated extends StatelessWidget {
  String image;
  String title;
  String category;
  double rating;
  int price;
  TopRated(
      {super.key,
      required this.category,
      required this.image,
      required this.price,
      required this.rating,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      // height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              category,
              style: GoogleFonts.urbanist(color: Colors.grey.shade800),
            ),
            Text(
              title,
              style: GoogleFonts.urbanist(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text(
              rating.toString() + " / 5",
              style: GoogleFonts.urbanist(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(
              "\$139.00",
              style: GoogleFonts.urbanist(
                  fontSize: 18,
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
