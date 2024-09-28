import 'package:final_project/features/Home/presentation/views/wedgits/animation_background.dart';
import 'package:flutter/material.dart';

class HomeViewbody extends StatefulWidget {
  const HomeViewbody({super.key});

  @override
  State<HomeViewbody> createState() => _HomeViewbodyState();
}

class _HomeViewbodyState extends State<HomeViewbody> {
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Color.fromARGB(221, 119, 118, 118),
      body: SingleChildScrollView(child: AnimationBackground())
    );
  }
}
