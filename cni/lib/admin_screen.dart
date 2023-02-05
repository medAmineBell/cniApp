import 'package:cni/models/student.dart';
import 'package:cni/provider/data_provider.dart';
import 'package:cni/widget/student_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminSceen extends StatefulWidget {
  const AdminSceen({super.key});

  @override
  State<AdminSceen> createState() => _AdminSceenState();
}

class _AdminSceenState extends State<AdminSceen> {
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    students = Provider.of<DataProvider>(context, listen: false).students;
  }

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
                ...students
                    .map((e) => StudentItem(
                          student: e,
                        ))
                    .toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}
