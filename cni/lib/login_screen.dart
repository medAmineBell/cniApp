import 'package:cni/admin_screen.dart';
import 'package:cni/confirmation_screen.dart';
import 'package:cni/inscription_done_screen.dart';
import 'package:cni/inscription_screen.dart';
import 'package:cni/provider/data_provider.dart';
import 'package:cni/stage_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController cincontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool _validcin = false;
  bool _validpwd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Se connecter",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                controller: cincontroller,
                decoration: InputDecoration(
                  labelText: 'CIN',
                  errorText: _validcin ? 'CIN est vide!' : null,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                autofocus: false,
                obscureText: true,
                controller: passwordcontroller,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  errorText: _validpwd ? 'Mot de passe est vide!' : null,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () async {
                setState(() {
                  cincontroller.text.isEmpty
                      ? _validcin = true
                      : _validcin = false;
                  passwordcontroller.text.isEmpty
                      ? _validpwd = true
                      : _validpwd = false;
                });
                if (cincontroller.text.isNotEmpty &&
                    passwordcontroller.text.isNotEmpty) {
                  final result =
                      await Provider.of<DataProvider>(context, listen: false)
                          .login(cincontroller.text, passwordcontroller.text);
                  if (result) {
                    final user =
                        Provider.of<DataProvider>(context, listen: false).user;
                    if (user.role == "admin") {
                      await Provider.of<DataProvider>(context, listen: false)
                          .getStages();
                      await Provider.of<DataProvider>(context, listen: false)
                          .getStudents();
                      await Provider.of<DataProvider>(context, listen: false)
                          .getUsers();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => AdminSceen(),
                        ),
                      );
                    } else {
                      final status = await Provider.of<DataProvider>(context,
                              listen: false)
                          .checkStageStatus(user.id);

                      if (status) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                ConfirmationScreen(),
                          ),
                        );
                      } else {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                InscriptionDoneScreen(),
                          ),
                        );
                      }
                    }
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => InscriptionScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "Inscrire",
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
