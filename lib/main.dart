import 'package:flutter/material.dart';
import 'package:task/bottom_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: const BottomNavigationScreen(),
    );
  }
}
