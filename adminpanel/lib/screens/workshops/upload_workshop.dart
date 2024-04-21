import 'dart:io';
import 'package:adminpanel/constants/constants.dart';
import 'package:adminpanel/providers/workshop_provider.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:adminpanel/components/custom_button.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UploadNewWorkShop extends StatefulWidget {
  const UploadNewWorkShop({super.key});

  @override
  State<UploadNewWorkShop> createState() => _UploadNewWorkShopState();
}

class _UploadNewWorkShopState extends State<UploadNewWorkShop> {
  late UploadTask _uploadTask;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ticketController = TextEditingController();
  TextEditingController slotController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String startDateFormatted = "Select Start Date";
  String endDateFormatted = "Select End  Date";

  String formatDate(DateTime date) {
    // Format the day of the week
    String dayOfWeek = DateFormat.E().format(date); // "Sun"
    // Format the day of the month
    String dayOfMonth = DateFormat.d().format(date); // "27"
    // Format the month name
    String month = DateFormat.MMMM().format(date); // "April"
    // Combine the formatted parts into the desired format
    String formattedDate = '$dayOfWeek - $dayOfMonth $month';

    return formattedDate;
  }

  String formatTime(DateTime dateTime) {
    final String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  File? _image;
  String? _imagePath;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Add Workshop",
          style: GoogleFonts.poppins(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Add a Title",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: titleController,
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
                height: 20,
              ),
              Text(
                "Add a Description",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: descriptionController,
                maxLength: 100,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: "Enter Workshop Description",
                  hintStyle: GoogleFonts.poppins(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  _getImage();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: (_image != null)
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    _image!,
                                  ))),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.upload),
                                Text("Tap here to Upload an Image"),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Date",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2050));
                          if (pickedDate != null && pickedDate != startDate) {
                            setState(() {
                              startDate = pickedDate;
                              startDateFormatted = formatDate(startDate);
                            });
                          }
                          print(endDateFormatted);
                          print(startDate);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                formatDate(startDate),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500),
                              )),
                              Image.asset("lib/assets/logo/downarrow.png",
                                  scale: 4.5)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "End Date",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2050));
                          if (pickedDate != null && pickedDate != endDate) {
                            setState(() {
                              endDate = pickedDate;
                              endDateFormatted = formatDate(endDate);
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                formatDate(endDate),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500),
                              )),
                              Image.asset("lib/assets/logo/downarrow.png",
                                  scale: 4.5)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Time",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (pickedTime != null) {
                            setState(() {
                              startDate = DateTime(
                                startDate.year,
                                startDate.month,
                                startDate.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );
                            });
                          }
                          print(startDate);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                formatTime(startDate),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500),
                              )),
                              Image.asset("lib/assets/logo/downarrow.png",
                                  scale: 4.5)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "End Time",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (pickedTime != null) {
                            setState(() {
                              endDate = DateTime(
                                endDate.year,
                                endDate.month,
                                endDate.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );
                            });
                          }
                          print(endDate);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                formatTime(endDate),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500),
                              )),
                              Image.asset("lib/assets/logo/downarrow.png",
                                  scale: 4.5)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Text(
                " Ticket Name",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: eventLocationController,
                keyboardType: TextInputType.text,
                autocorrect: true,
                decoration: InputDecoration(
                  prefix: Icon(
                    Icons.location_on,
                    size: 15,
                  ),
                  hintText: "Ticket Name",
                  hintStyle: GoogleFonts.poppins(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                " Workshop Location",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: eventLocationController,
                keyboardType: TextInputType.text,
                autocorrect: true,
                decoration: InputDecoration(
                  prefix: Icon(
                    Icons.location_on,
                    size: 15,
                  ),
                  hintText: "Enter Event Location",
                  hintStyle: GoogleFonts.poppins(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Ticket Price",
                          style: GoogleFonts.poppins(fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: ticketController,
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          decoration: InputDecoration(
                            prefix: Icon(
                              Icons.attach_money,
                              size: 16,
                            ),
                            hintText: "Enter Ticket Price",
                            hintStyle: GoogleFonts.poppins(fontSize: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Category",
                          style: GoogleFonts.poppins(fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: slotController,
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          decoration: InputDecoration(
                            prefix: Text(""),
                            hintText: "Art",
                            hintStyle: GoogleFonts.poppins(fontSize: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 50,
              ),
              Consumer(
                builder: (context, ref, child) => Center(
                  child: CustomButton(
                    text: "Publish",
                    color: primaryColor,
                    textColor: Colors.white,
                    function: () async {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.info(
                          message: "Uploading Image",
                        ),
                      );
                      final workShopProviderInstance =
                          ref.watch(workshopprovider);
                      String downloadUrl = await workShopProviderInstance
                          .uploadImage(_image!, titleController.text.trim());
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.info(
                          message: "Image Uploaded",
                        ),
                      );
                      Map<String, dynamic> workshopData = {
                        'image': downloadUrl,
                        'title': titleController.text.trim() ?? "Not Available",
                        'description': descriptionController.text.trim() ??
                            "Not Available",
                        'startTime':
                            startDate, // Assuming startTime is a DateTime
                        'endTime': endDate, // Assuming endTime is a DateTime
                        'ticketPrice': ticketController.text
                            .trim(), // Assuming ticketPrice is an int
                        'eventLocation': eventLocationController.text.trim() ??
                            "Not Available",
                        'slots': slotController.text.trim() ??
                            "Not Available", // Assuming slots is an int
                        'registered': 0, // Assuming registered is an int
                        'enrollments':
                            [], // Assuming enrollments is an array of strings
                      };
                      try {
                        await FirebaseFirestore.instance
                            .collection('workshops')
                            .doc(titleController.text.trim())
                            .set(workshopData);
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.info(
                            message: "Workshop uploaded successfully.",
                          ),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message: "Error uploading workshop: $e",
                          ),
                        );
                      }
                      print(workshopData);
                      print(downloadUrl);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
