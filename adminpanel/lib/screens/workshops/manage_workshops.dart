import 'package:adminpanel/screens/workshops/upload_workshop.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManageWorkshops extends StatefulWidget {
  const ManageWorkshops({super.key});

  @override
  State<ManageWorkshops> createState() => _ManageWorkshopsState();
}

class _ManageWorkshopsState extends State<ManageWorkshops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.orange,
          label: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UploadNewWorkShop()));
          }),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage Workshops"),
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
            return WorkshopTile(
              title: workshop['title'],
              description: workshop['description'],
            );
          },
        );
      },
    );
  }
}

class WorkshopTile extends StatelessWidget {
  final String? title;
  final String? description;

  WorkshopTile({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title ?? ''),
      subtitle: Text(description ?? ''),
      onTap: () {
        // Handle tile tap
      },
    );
  }
}
