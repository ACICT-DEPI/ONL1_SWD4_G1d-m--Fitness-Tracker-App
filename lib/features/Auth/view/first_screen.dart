import 'package:final_project/features/Auth/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_Auth_button.dart';
import '../widgets/custom_background.dart';
import 'login_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        FitnessBackground(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomAuthButton(text: "Get Started", onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:  (context) => SignUpScreen(),));
              }),
              SizedBox(height: 10),
              Text("or",),
              TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:  (context) => LoginScreen(),));
                      },
                      child: Text("Log in",
                          style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              color: Colors.white)),
                    ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
