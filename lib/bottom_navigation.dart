import 'package:flutter/material.dart';
import 'package:task/Custom.dart';
import 'package:task/screens/booking_scrn.dart';
import 'package:task/screens/packages.dart';
import 'package:task/screens/profile.dart';

import 'screens/home_scrn.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/image_icon/home.png')),
          label: 'Home'),
      const BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/image_icon/sale (1).png')),
          label: 'Packages'),
      const BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/image_icon/clock (1).png')),
          label: 'Booking'),
      const BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/image_icon/user (7).png')),
          label: 'Profile'),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: const <Widget>[
        HomeScreen(),
        PacakagesScrn(),
        BookingScrn(),
        ProfileScrn(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        iconSize: 20,
        selectedItemColor: ColorClass.pink1,
        unselectedItemColor: Colors.grey,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}
