import 'package:cni/widget/student_item.dart';
import 'package:flutter/material.dart';

class AdminSceen extends StatefulWidget {
  const AdminSceen({super.key});

  @override
  State<AdminSceen> createState() => _AdminSceenState();
}

class _AdminSceenState extends State<AdminSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Liste des stagiaires",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                StudentItem(),
                StudentItem(),
                StudentItem(),
                StudentItem(),
                StudentItem(),
                StudentItem(),
                StudentItem(),
                StudentItem(),
                StudentItem(),
                StudentItem(),
                StudentItem(),
                StudentItem(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
