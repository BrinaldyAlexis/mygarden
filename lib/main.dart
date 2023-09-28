import 'package:flutter/material.dart';
import 'package:mygarden/constants.dart';
import 'package:mygarden/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyGarden',
      theme: ThemeData.light().copyWith(
        primaryColor: Constants().primaryColor,
        scaffoldBackgroundColor: Constants().backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Constants().primaryColor
          ),
        )
      ),
      home: const HomeScreen()
    );
  }
}