import 'package:flutter/material.dart';
import 'package:uts_2020130016/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2020130016 - Aloysius Jonathan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255,7,54,46)),
        useMaterial3: true,
        fontFamily: 'LibreBaskerville',
      ),
      home: const LogInScreen(),
    );
  }
}