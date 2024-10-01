import 'package:final_project/core/custom_wedgits/custom_bottomnavigationbar.dart';
import 'package:final_project/features/Auth/view/first_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: _checkUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while checking
        } else if (snapshot.hasData && snapshot.data != null) {
          return FloatingNavBar(); // User is logged in, navigate to Home
        } else {
          return FirstScreen(); // User is not logged in, show Login
        }
      },
    );
  }

  Future<User?> _checkUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Optionally, you can check if the user is signed in with a valid token
      // String token = await user.getIdToken();
    }
    return user;
  }
}