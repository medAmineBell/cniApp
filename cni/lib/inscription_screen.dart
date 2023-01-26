import 'package:cni/inscription_done_screen.dart';
import 'package:flutter/material.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  TextEditingController nomcontroller = TextEditingController();
  TextEditingController prenomcontroller = TextEditingController();
  TextEditingController niveaucontroller = TextEditingController();
  TextEditingController telephonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController cincontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();

  DateTime? _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Remplir cette formulaire",
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
                    //errorText: _validatname ? 'Event name empty' : null,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  controller: nomcontroller,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    //errorText: _validatname ? 'Event name empty' : null,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  controller: prenomcontroller,
                  decoration: InputDecoration(
                    labelText: 'Prenom',
                    //errorText: _validatname ? 'Event name empty' : null,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DatePicker(
                  context,
                  leading: getDateStr(_date!),
                  trailing: 'Date Naissance',
                  updateDateState: (date) => setState(() {
                    _date = date;
                  }),
                  openDate: DateTime.now(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                  controller: telephonecontroller,
                  decoration: InputDecoration(
                    labelText: 'Téléphone',
                    //errorText: _validatname ? 'Event name empty' : null,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  autofocus: false,
                  controller: addresscontroller,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    //errorText: _validatname ? 'Event name empty' : null,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  controller: niveaucontroller,
                  decoration: InputDecoration(
                    labelText: 'Niveau',
                    //errorText: _validatname ? 'Event name empty' : null,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  controller: locationcontroller,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    //errorText: _validatname ? 'Event name empty' : null,
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          InscriptionDoneScreen(),
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
