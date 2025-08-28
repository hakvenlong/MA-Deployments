import 'package:flutter/material.dart';
import 'package:pos/screens/home_screen.dart';
import 'package:pos/screens/menu_screen.dart';
import 'package:pos/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late final PageController _controller = PageController(
    initialPage: currentIndex,
  ); // late :
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
        elevation: 10,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(), // can not scroll pageview
        controller: _controller, // _controller form pageController
        children: [HomeScreen(), ProfileScreen(), MenuScreen()],
      ),
      // body: {
      //   HomeScreen(),
      //   ProfileScreen(),
      //   MenuScreen()
      // }.elementAt(currentIndex), // for add value in the other page

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          _controller.animateToPage(
            value,
            duration: Duration(milliseconds: 350),
            curve: Curves.linear,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
            activeIcon: Icon(Icons.account_circle),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
            activeIcon: Icon(Icons.menu_sharp),
          ),
        ],
      ),
    );
  }
}
