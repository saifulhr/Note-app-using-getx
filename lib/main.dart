import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:note_pad_getx/screens/bottom_nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        dialogTheme: DialogThemeData(backgroundColor: Colors.white),
      ),
      home: BottomNavScreen(),
    );
  }
}
