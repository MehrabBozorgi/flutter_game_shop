import 'package:flutter/material.dart';
import 'package:flutter_game_shop/screens/bottom_nav.dart';
import 'package:flutter_game_shop/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'roboto', useMaterial3: false),
      home: const FirstScreen(),
    );
  }
}
