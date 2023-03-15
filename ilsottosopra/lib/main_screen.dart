import 'package:flutter/material.dart';
import 'package:ilsottosopra/assets/home_page.dart';
import 'package:ilsottosopra/assets/profile_screen.dart';
import 'package:ilsottosopra/assets/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    HomePage(),
    ProfileScreen(),
    SettingScreen(),
  ];
  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
            child: Image.asset(
          "lib/assets/logo.png",
          width: 200,
        )),
        actions: const [
          SizedBox(
            width: 45,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: changeIndex,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "settings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "profile",
            ),
          ]),
      body: screens.elementAt(selectedIndex),
    );
  }
}
