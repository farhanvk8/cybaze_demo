import 'package:demo_app/ui/category_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CategoryScreen(),
    );
  }
}
