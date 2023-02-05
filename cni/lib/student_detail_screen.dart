import 'package:cni/admin_screen.dart';
import 'package:cni/models/stage.dart';
import 'package:cni/models/student.dart';
import 'package:cni/models/user.dart';
import 'package:cni/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentDetailScreen extends StatefulWidget {
  final Student student;
  const StudentDetailScreen({super.key, required this.student});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  bool validate = false;
  late User user;
  late Stage stage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = Provider.of<DataProvider>(context, listen: false)
        .users
        .firstWhere((user) => user.id == widget.student.userId);
    stage = Provider.of<DataProvider>(context, listen: false)
        .stages
        .firstWhere((stage) => stage.userId == widget.student.userId);
    validate = stage.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student.nom + " " + widget.student.prenom),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.student.nom + " " + widget.student.prenom,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "CIN : " + user.cin,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Date de naissance : " + widget.student.dateNaissance,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Téléphone : " + widget.student.telephone,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Addresse : " + widget.student.address,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Niveau: " + widget.student.niveau,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Location: " + widget.student.location,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Type de stage: " + stage.type,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sujet: " + stage.sujet,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              stage.payer ? "Payé: Oui" : "Payé: Non",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Du " + stage.dateDep + " Au " + stage.dateFin,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Encadrant: " + stage.encadrant,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  validate ? "Status: Validé" : "Status: Non Validé",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  validate ? Icons.check_circle_outline : Icons.cancel_outlined,
                  color: validate ? Colors.green : Colors.red,
                )
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: validate
                  ? null
                  : () async {
                      await Provider.of<DataProvider>(context, listen: false)
                          .validateStage(stage.id);
                      setState(() {
                        validate = true;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => AdminSceen(),
                        ),
                      );
                    },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "Valider",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
