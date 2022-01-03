import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/controller/button_controller.dart';
import 'package:simple_calculator/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ButtonController(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}