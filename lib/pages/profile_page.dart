import 'package:app_auth/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //get auth service
  final authService = AuthService();

  //logout button pressed
  void logout() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    //get user email
    final currentEmail = authService.getCurrentUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          //logout button
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Center(child: Text(currentEmail.toString())),
    );
  }
}
