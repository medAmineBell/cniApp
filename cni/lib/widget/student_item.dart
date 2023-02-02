import 'package:cni/student_detail_screen.dart';
import 'package:flutter/material.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text("Nom Prenom"),
          subtitle: Text("Status"),
          trailing: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => StudentDetailScreen(),
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
