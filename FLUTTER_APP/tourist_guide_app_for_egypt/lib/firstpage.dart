//navigation system page
/*
  //main-> signe up  -->secondpage(loge in page)
     navigation-->firstpage
     {
      home -->thirdpage
      Favorites Page -->fourthpage
     
     }


 */
import 'package:flutter/material.dart';
import 'package:tourist_guide_app_for_egypt/third.dart';
import 'fourthpage.dart';
import 'fifthpage.dart';
import 'sixenpage.dart';

// ignore: non_constant_identifier_names
int page_Indix = 0;

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  List<Widget> pages = [
    third(),
    Fourthpage(),
    Fifthpage(), //favo
    pagesix(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300), // Transition duration
        child: pages[page_Indix], // The current page
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 1), // Slide in from right
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page_Indix,
        onTap: (value) {
          setState(() {
            page_Indix = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Governments", icon: Icon(Icons.place)),
          BottomNavigationBarItem(
              label: "Favorites", icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(
              label: "Profile", icon: Icon(Icons.person)),
        ],
        selectedItemColor: const Color.fromRGBO(255, 0, 0, 1), // Change selected icon color to black
        unselectedItemColor: Colors.black, // Change unselected icon color to black
      ),
    );
  }
}
