import 'package:apis_series/get_apis/example_five.dart';
import 'package:apis_series/get_apis/example_four.dart';
import 'package:apis_series/get_apis/example_three.dart';
import 'package:apis_series/get_apis/example_two.dart';
import 'package:apis_series/home_page.dart';
import 'package:apis_series/pratice.dart';
import 'package:apis_series/signup.dart';
import 'package:apis_series/upload_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: HomScreen(),
    );
  }
}
