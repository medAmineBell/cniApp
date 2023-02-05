import 'package:cni/provider/data_provider.dart';
import 'package:cni/stage_envoyer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StageScreen extends StatefulWidget {
  final String userId;
  const StageScreen({super.key, required this.userId});

  @override
  State<StageScreen> createState() => _StageScreenState();
}

class _StageScreenState extends State<StageScreen> {
  TextEditingController typecontroller = TextEditingController();
  TextEditingController sujetcontroller = TextEditingController();
  TextEditingController encadrantcontroller = TextEditingController();

  DateTime? _dateDebStage = DateTime.now();
  DateTime? _dateFinStage = DateTime.now();

  bool paid = false;
  bool _validtype = false;
  bool _validsujet = false;
  bool _validencadrant = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stage"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Remplir cette formulaire",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                controller: typecontroller,
                decoration: InputDecoration(
                  labelText: 'Type de stage',
                  errorText: _validtype ? 'Type de stage est vide!' : null,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                autofocus: false,
                maxLines: 4,
                controller: sujetcontroller,
                decoration: InputDecoration(
                  labelText: 'Sujet',
                  errorText: _validsujet ? 'Sujet de stage est vide!' : null,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Periode du stage",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: DatePicker(
                context,
                leading: getDateStr(_dateDebStage!),
                trailing: 'Debut',
                updateDateState: (date) => setState(() {
                  _dateDebStage = date;
                }),
                openDate: DateTime.now(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: DatePicker(
                context,
                leading: getDateStr(_dateFinStage!),
                trailing: 'Au',
                updateDateState: (date) => setState(() {
                  _dateFinStage = date;
                }),
                openDate: DateTime.now(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Stage Payé",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            RadioListTile(
                title: Text("Non"),
                value: false,
                groupValue: paid,
                onChanged: (value) {
                  setState(() {
                    paid = value!;
                  });
                }),
            RadioListTile(
                title: Text("Oui"),
                value: true,
                groupValue: paid,
                onChanged: (value) {
                  setState(() {
                    paid = value!;
                  });
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                controller: encadrantcontroller,
                decoration: InputDecoration(
                  labelText: 'Encadrant',
                  errorText: _validencadrant ? 'Encadrant est vide!' : null,
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
                  typecontroller.text.isEmpty
                      ? _validtype = true
                      : _validtype = false;
                  sujetcontroller.text.isEmpty
                      ? _validsujet = true
                      : _validsujet = false;
                  encadrantcontroller.text.isEmpty
                      ? _validencadrant = true
                      : _validencadrant = false;
                });
                if (typecontroller.text.isNotEmpty &&
                    sujetcontroller.text.isNotEmpty &&
                    encadrantcontroller.text.isNotEmpty) {
                  await Provider.of<DataProvider>(context, listen: false)
                      .addStage(
                          typecontroller.text,
                          sujetcontroller.text,
                          encadrantcontroller.text,
                          getDateStr(_dateDebStage!),
                          getDateStr(_dateFinStage!),
                          paid,
                          widget.userId);
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => StageEnvoyerScreen(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "Envoyer",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            //     child: Text(
            //       "Envoyer",
            //       style: TextStyle(
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  final BuildContext context;
  final String leading;
  final String trailing;
  final Function updateDateState;
  final DateTime? openDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  DatePicker(
    this.context, {
    this.leading = '',
    this.trailing = '',
    required this.updateDateState,
    this.openDate,
    this.firstDate,
    this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(leading),
          Text(trailing),
          Icon(
            Icons.calendar_today,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      onPressed: () async {
        DateTime? date = await openDatePicker(
          context,
          openDate: openDate,
          firstDate: firstDate,
          lastDate: lastDate,
        );

        if (date != null) {
          DateTime now = DateTime.now();
          DateTime dateWithCurrentTime = DateTime(
            date.year,
            date.month,
            date.day,
            now.hour,
            now.minute,
            now.second,
          );
          updateDateState(dateWithCurrentTime);
        }
      },
    );
  }
}

Future<DateTime?> openDatePicker(
  BuildContext context, {
  DateTime? openDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) {
  return showDatePicker(
    context: context,
    initialDate: openDate ?? DateTime.now(),
    firstDate: firstDate ??
        DateTime.now().subtract(
          Duration(days: 365 * 100),
        ),
    lastDate: lastDate ??
        DateTime.now().add(
          Duration(days: 365),
        ),
  );
}

String getDateStr(DateTime date) {
  if (date == null) {
    return 'mm/dd/yyyy';
  }
  String year = date.year.toString();
  String month = date.month.toString();
  String day = date.day.toString();
  return '$year-${getTwoDigitStr(month)}-${getTwoDigitStr(day)}';
}

String getTwoDigitStr(String str) {
  return str.length == 1 ? '0$str' : str;
}
