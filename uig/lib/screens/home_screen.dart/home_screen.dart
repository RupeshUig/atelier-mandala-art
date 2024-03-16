import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uig/controllers/auth_controllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Logged In as ${user.email}"),
        actions: [
          IconButton(
              onPressed: () {
                AuthController.instance.logout();
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
