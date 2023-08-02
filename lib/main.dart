import 'package:flutter/material.dart';
import 'package:bmi/Screens/InputPage.dart';
import 'package:bmi/Screens/result_page.dart';


void main() {
  runApp(const bmi());
}

class bmi extends StatelessWidget {
  const bmi({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
      primaryColor: const Color(0xFF0A0E21),
      scaffoldBackgroundColor: const Color(0xFF0A0E21),
    ),
      home: InputPage(),
    );
  }
}

