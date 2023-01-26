import 'package:cni/login_screen.dart';
import 'package:flutter/material.dart';

class InscriptionDoneScreen extends StatefulWidget {
  const InscriptionDoneScreen({super.key});

  @override
  State<InscriptionDoneScreen> createState() => _InscriptionDoneScreenState();
}

class _InscriptionDoneScreenState extends State<InscriptionDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Inscription récu",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
