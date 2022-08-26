import 'package:flutter/material.dart';
import 'package:javier_dicoding_final/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Converter",
      theme: ThemeData(canvasColor: Color(0xffececec)),
      home: Splashscreen(),
    );
  }
}
