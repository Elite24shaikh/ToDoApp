import 'package:flutter/material.dart';
import 'package:todo/src/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Application',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
