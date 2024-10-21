import 'package:final_project/core/custom_wedgits/custom_bottomnavigationbar.dart';
import 'package:final_project/core/utils/share_snackbar.dart';
import 'package:final_project/features/Auth/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StreamBuilderWidget extends StatelessWidget {
  const StreamBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (snapshot.hasError) {
            return snackbarshare(context, "Something went wrong");
          } else if (snapshot.hasData) {
            // if (mounted) return;
            return const FloatingNavBar(); // home() OR verify email
          } else {
            return LoginScreen();
          }
        });
  }
}
