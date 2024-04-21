import 'dart:io';

import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adminpanel/models/workshop_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final workshopprovider = ChangeNotifierProvider((ref) => Workshop());

class Workshop extends ChangeNotifier {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final CollectionReference _workshopsCollection =
      FirebaseFirestore.instance.collection('workshops');

  Future<void> deleteWorkshop(String workshopId, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('workshops')
          .doc(workshopId)
          .delete();
      print('Workshop deleted successfully.');
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Workshop deleted",
        ),
      );
    } catch (e) {
      print('Error deleting workshop: $e');
    }
  }

  Future<void> updateField(
      String workshopId, String fieldName, dynamic newValue) async {
    try {
      await FirebaseFirestore.instance
          .collection('workshops')
          .doc(workshopId)
          .update({
        fieldName: newValue,
      });
      print('Field updated successfully.');
    } catch (e) {
      print('Error updating field: $e');
    }
  }

  // Add a JSON object to the enrollments array
  Future<void> addEnrollment(
      String workshopId, Map<String, dynamic> enrollmentData) async {
    try {
      await FirebaseFirestore.instance
          .collection('workshops')
          .doc(workshopId)
          .update({
        'enrollments': FieldValue.arrayUnion([enrollmentData]),
      });
      print('Enrollment added successfully.');
    } catch (e) {
      print('Error adding enrollment: $e');
    }
  }

// Remove a JSON object from the enrollments array
  Future<void> removeEnrollment(
      String workshopId, Map<String, dynamic> enrollmentData) async {
    try {
      await FirebaseFirestore.instance
          .collection('workshops')
          .doc(workshopId)
          .update({
        'enrollments': FieldValue.arrayRemove([enrollmentData]),
      });
      print('Enrollment removed successfully.');
    } catch (e) {
      print('Error removing enrollment: $e');
    }
  }

  Future<void> incrementSlots(String workshopId) async {
    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentReference workshopRef =
            FirebaseFirestore.instance.collection('workshops').doc(workshopId);

        DocumentSnapshot snapshot = await transaction.get(workshopRef);

        if (snapshot.exists) {
          int currentSlots = snapshot.get('slots') ?? 0;
          transaction.update(workshopRef, {'slots': currentSlots + 1});
        }
      });
      print('Slots incremented successfully.');
    } catch (e) {
      print('Error incrementing slots: $e');
    }
  }

  Future<String> uploadImage(File imageFile, String fileName) async {
    print(fileName);
    print(imageFile.path);
    try {
      // Upload file to Firebase Storage
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("workshopImages")
          .child(fileName);
      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      print(downloadUrl);
      return downloadUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return ''; // Return empty string in case of error
    } finally {
      print("Upload complete"); // Print message indicating upload completion
    }
  }
}
