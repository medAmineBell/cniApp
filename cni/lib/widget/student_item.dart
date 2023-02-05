import 'package:cni/models/student.dart';
import 'package:cni/student_detail_screen.dart';
import 'package:flutter/material.dart';

class StudentItem extends StatelessWidget {
  final Student student;
  const StudentItem({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(student.nom + " " + student.prenom),
          subtitle: Text(student.telephone),
          trailing: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      StudentDetailScreen(student: student),
                ),
              );
            },
            child: Text("Voir detail"),
          ),
        ),
      ),
    );
  }
}
