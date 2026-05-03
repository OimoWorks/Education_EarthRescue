import 'package:chikyu_rescue/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChikyuRescueApp());
}

class ChikyuRescueApp extends StatelessWidget {
  const ChikyuRescueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ちきゅうレスキュー',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
