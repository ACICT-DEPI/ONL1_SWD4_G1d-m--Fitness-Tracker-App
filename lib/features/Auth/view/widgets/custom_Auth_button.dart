import 'package:final_project/core/utls/colors.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  CustomAuthButton({super.key,
    required this.text,
    required this.onPressed
  });

  late String text;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10,
                horizontal: MediaQuery.of(context).size.width / 4),
            child: Text(text,
              style: TextStyle(
                  color: Colors.black,
                fontSize: 20
              ),),
          ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colorsapp.primarycolor,
          elevation: 4,
            shape:  const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
        ),
      ),
    );
  }
}
