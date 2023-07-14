import 'package:flutter/material.dart';
import 'package:laboar/view/screens/home_screens/Catigories.dart';
import 'package:laboar/view/screens/home_screens/History.dart';
import 'package:laboar/view/screens/home_screens/Profile.dart';
import 'package:laboar/view/screens/home_screens/homepage.dart';
import 'package:laboar/view/styles/colors.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      {
        "title": "Home",
        "page": const HomeScreen(),
      },
      {
        "title": "History",
        "page": const HistoryScreen(),
      },
      {
        "title": "Catigories",
        "page": const CatigoriesScreen(),
      },
      {
        "title": "Profile",
        "page": const ProfileScreen(),
      },
    ];

    return Scaffold(
      body: pages[currentPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: _onItemTapped,
        elevation: 0,
        selectedItemColor: greenColor,
        unselectedItemColor: lightGrayColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.apps_sharp), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }
}
