import 'package:cni/inscription_screen.dart';
import 'package:cni/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CNI App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }
}
