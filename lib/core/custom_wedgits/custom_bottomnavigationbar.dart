import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/home_view.dart';
import 'package:final_project/features/Target/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';

class FloatingNavBar extends StatefulWidget {
  const FloatingNavBar({super.key});

  @override
  State<FloatingNavBar> createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
//   int _selectedIndex = 0;
//   static List<IconData> iconpages = [
//     Icons.home,
//     Icons.timer,
//     Icons.person,
//   ];
// List of screens or widgets for each navigation item
  List<Widget> pages = [
    HomeScreen(),
    HomeView(),
    HomeView(),
  ];
  int mycurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          decoration: BoxDecoration(
           
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 1,
                offset:Offset(0, 20) 
              ),
            ],
          ),
          height: 70, 
          child: ClipRRect(
            
            borderRadius: BorderRadius.circular(22),
            child: BottomNavigationBar(
             elevation: 1,
              selectedFontSize: 12,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              //backgroundColor: const Color.fromARGB(80, 0, 0, 0),
              ///Changes here: just these 2 lines
              backgroundColor: Colors.white,
              unselectedItemColor: Colorsapp.darkGrey,
              ///*********************************
              selectedItemColor: Colorsapp.liteOrange,
              //unselectedItemColor: Colors.white,
                currentIndex: mycurrentIndex,
                onTap: (index) {
                  setState(() {
                    mycurrentIndex = index;
                  });
                },
                items:const [
                  BottomNavigationBarItem(icon: Icon(Icons.home,),label: "home"),
                  BottomNavigationBarItem(icon: Icon(Icons.timer,),label: "home"),
                  BottomNavigationBarItem(icon: Icon(Icons.person,),label: "home"),
                ]),
          ),
        ),
      ),
    body:pages[mycurrentIndex] ,
    );
  }
}

 


 