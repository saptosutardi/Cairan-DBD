import 'package:flutter/material.dart';
import 'package:flutter_application_1/about_us_dialog.dart';
import 'package:flutter_application_1/calculation_method.dart';
import 'package:flutter_application_1/obes_container.dart';
import 'package:flutter_application_1/infus_kind.dart';
import 'package:flutter_application_1/container_grade.dart';
import 'package:google_fonts/google_fonts.dart';

import 'weight_text_field.dart';
import 'globals.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cairan DBD',
      home: const MyHomePage(title: 'Perhitungan Carian DBD'),
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.red,
        unselectedWidgetColor: Colors.red, //
      ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFBFA),
        elevation: 0,

        // HEADER
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Cairan ',
              style: TextStyle(color: Colors.black87), //<-- SEE HERE
            ),
            Text(
              'DBD',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            )
            // style: GoogleFonts.lato(fontStyle: FontStyle.italic)),
          ],
        ),

        // ABOUT US
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_outlined,
                color: Colors.black45),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AboutUsDialog();
                },
              );
            },
          ),
        ],
      ),

      // BODY
      body: Container(
        color: const Color.fromRGBO(255, 251, 251, 100),
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                color: const Color(0xFFF4DDDC),
                clipBehavior: Clip.antiAlias,
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        // WEIGHT INPUT
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            // WIEIGHT TEXT FIELD
                            WeightTextField(),

                            // OBES BUTTON
                            ObeseContainer(),
                          ],
                        ),

                        // GRADE
                        const ContainerGrade(),

                        // INFUS SET TYPE
                        const InfusKind(),

                        const Divider(color: Colors.brown),

                        // CALCULATION
                        const CalculationMethod()
                      ],
                    )),
              ),
            ]),
      ),
    );
  }

  Row methodCalculation() {
    return Row(
      children: [
        const Spacer(),
        // KOSONGKAN
        Container(
          height: 36,
          margin: const EdgeInsets.only(right: 8.0),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                globals.grade = null;
                globals.infus = null;
                globals.etWeightHolder.text = "";
                globals.visibleRecomendation = 0;
              });
            },
            style: OutlinedButton.styleFrom(
              primary: Colors.red,
              side: const BorderSide(color: Colors.red),
              shape: const StadiumBorder(),
            ),
            child: const Text('Kosongkan'),
          ),
        ),
        SizedBox(
            height: 36,
            child: ElevatedButton(
              onPressed: inputValidation,
              style: ElevatedButton.styleFrom(
                  primary: Colors.red, shape: const StadiumBorder()),
              child: const Text('Hitung'),
            )),
      ],
    );
  }

  void inputValidation() {
    setState(() {
      globals.result = globals.etWeightHolder.text;

      if (globals.result.isEmpty ||
          globals.grade == null ||
          globals.infus == null) {
        showDialog(
            context: context,
            builder: (BuildContext contex) {
              return AlertDialog(
                title: const Text("Perhatikan..."),
                content: const Text("Silakan mengisi form dengan lengkap!"),
                actions: <Widget>[
                  TextButton(
                    child: Text('Oke', style: TextStyle(color: globals.brown)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      } else {
        bottomSheetResult();
      }
    });
  }

  void bottomSheetResult() {
    calculating();
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.pink[50],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (BuildContext build) {
          var needs = globals.need;
          return Container(
            padding: const EdgeInsets.all(15),
            child: Wrap(
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: const Text(
                      'REKOMENDASI:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                Row(
                  children: const [
                    Text(
                      "INFUS:",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                Row(
                  children: [
                    Row(children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: const Icon(
                          Icons.play_circle,
                          color: Colors.blue,
                        ),
                      ),
                      Text("Isotonik (RL): \n$needs need ml/jam = "),
                    ]),

                    const Spacer(),

                    // TPM = DPM
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Row(children: [
                          Text(
                            globals.sDPM,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 28),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(globals.dpmOrImmediately))
                        ])),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void calculating() {
    setState(() {
      // result = etWeightHolder.text;
      // visibleRecomendation = 1;

      var infus = globals.infus;
      int wg = int.parse(globals.result);
      if (globals.grade == 0) {
        if (wg < 15) {
          globals.need = (wg * 7).toInt();
        } else if (wg > 40) {
          globals.need = (wg * 3).toInt();
        } else {
          globals.need = (wg * 5).toInt();
        }
        globals.dpmOrImmediately = "TPM";
      } else {
        globals.need = (wg * 20).toInt();
        globals.dpmOrImmediately = "ml SECEPA";
      }

      int dropFac;
      if (infus == 0) {
        dropFac = 15;
      } else if (infus == 1) {
        dropFac = 20;
      } else {
        dropFac = 60;
      }

      globals.dpm =
          (globals.need * dropFac) ~/ 60; //((need*dropFac)/60).toInt();
      globals.sDPM = globals.dpm.toString();
    });
  }
}
