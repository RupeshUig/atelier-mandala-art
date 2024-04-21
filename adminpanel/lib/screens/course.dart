import 'package:adminpanel/constants/constants.dart';
import 'package:adminpanel/providers/workshop_provider.dart';
import 'package:adminpanel/screens/workshops/upload_workshop.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Published Courses"),
      ),
      body: WorkshopList(),
    );
  }
}

class WorkshopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('workshops').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final workshops = snapshot.data!.docs;

        return ListView.builder(
          itemCount: workshops.length,
          itemBuilder: (context, index) {
            final workshop = workshops[index];
            Map<String, dynamic> data = workshop.data() as Map<String, dynamic>;
            return workshopTiles(workshop: data);
          },
        );
      },
    );
  }
}

Widget workshopTiles({required Map<String, dynamic> workshop}) {
  String formatDate(DateTime date) {
    String dayOfWeek = DateFormat.E().format(date); // "Sun"

    String dayOfMonth = DateFormat.d().format(date); // "27"

    String month = DateFormat.MMMM().format(date); // "April"

    String formattedDate = '$dayOfWeek - $dayOfMonth $month';

    return formattedDate;
  }

  String formatTime(DateTime dateTime) {
    final String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  Timestamp timestamp = workshop['startTime'];
  DateTime startDateDateTime = timestamp.toDate();
  Timestamp timestamp1 = workshop['endTime'];
  DateTime startDateDateTime1 = timestamp.toDate();
  String startTime = formatTime(startDateDateTime);
  String endTime = formatTime(startDateDateTime1);

  String startDate = formatDate(startDateDateTime);
  String endDate = formatDate(startDateDateTime1);
  if (workshop == null) {
    // Handle the case when workshop is null, such as showing a placeholder widget
    return SizedBox();
  }
  return Consumer(
    builder: (context, ref, child) => Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      height: 150,
      child: Card.outlined(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 120,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(workshop['image']),
                      fit: BoxFit.cover)),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    workshop['title'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('${workshop['registered']} Enrollments'),
                  Text(
                    '${startDate} to ${endDate}',
                    style: GoogleFonts.poppins(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${startTime} - ${endTime}',
                    style: GoogleFonts.poppins(
                        color: Colors.grey, fontWeight: FontWeight.bold),
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
