import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UploadNewWorkShop extends StatefulWidget {
  const UploadNewWorkShop({super.key});

  @override
  State<UploadNewWorkShop> createState() => _UploadNewWorkShopState();
}

class _UploadNewWorkShopState extends State<UploadNewWorkShop> {
  DateTime startDate = DateTime.now();
  DateTime? endDate;

  DateTime? _selectedDate = DateTime.now(); // Provide a default value

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate!,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = startDate != null
        ? DateFormat('dd/MM/yyyy').format(startDate!)
        : 'Select a date';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Workshop",
          style: GoogleFonts.poppins(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add a Title",
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                hintText: "Enter Workshop Title",
                hintStyle: GoogleFonts.poppins(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Add a Description",
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            TextField(
              maxLength: 100,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: "Enter Workshop Title",
                hintStyle: GoogleFonts.poppins(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      _selectDate(context);
                    },
                    child: Text("tap here"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
