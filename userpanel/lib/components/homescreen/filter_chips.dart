import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  CategoryChip({required this.text, required this.onTap});

  Color _getRandomColor() {
    final List<Color> colors = [
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.orange.shade100,
      Colors.pink.shade100,
      Colors.deepPurpleAccent.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.grey.shade100,
    ];
    final Random random = Random();
    return colors[random.nextInt(colors.length)];
  }

  Color _getRandomColorforTexts() {
    final List<Color> colors = [
      Colors.blue.shade800,
      Colors.deepPurpleAccent,
      Colors.purple.shade800,
      Colors.blueAccent,
    ];
    final Random random = Random();
    return colors[random.nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: Colors.transparent)),
        label: Text(
          text,
          style: GoogleFonts.urbanist(
              color: _getRandomColorforTexts(), fontWeight: FontWeight.bold),
        ),
        backgroundColor: _getRandomColor(),
      ),
    );
  }
}
