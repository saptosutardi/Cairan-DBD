import 'package:flutter/material.dart';
import 'package:flutter_application_1/AboutUsDialog.dart';
import 'package:flutter_application_1/ObeseDialog.dart';
import 'package:flutter_application_1/ObeseContainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'WeightTextField.dart';
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
                          children: [
                            // expandedTextFieldWeight(),
                            WeightTextField(),
                            // OBES
                            containerObes(context),
                            // ObeseContainer(context),
                          ],
                        ),

                        // GRADE
                        containerGrade(),

                        // INFUS SET TYPE
                        containerJenisInfus(),

                        const Divider(color: Colors.brown),

                        // CALCULATION
                        methodCalculation()
                      ],
                    )),
              ),
            ]),
      ),
    );
  }

  Container containerObes(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 8),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () async {
              setState(() => globals.obes = !globals.obes);
              await showDialog(
                  context: context,
                  builder: (BuildContext contex) {
                    return const ObeseDialog();
                  });
              setState(() {});
            },
            icon: Image.asset(
              'assets/fat_man.png',
              height: 18,
              width: 18,
              color: globals.obes ? Colors.black45 : Colors.white,
            ),
            label: const Text('Obesitas'),
            style: ElevatedButton.styleFrom(
              primary: globals.obes ? Colors.black12 : globals.brown,
              shadowColor: Colors.black12,
              onPrimary: globals.obes ? Colors.black54 : Colors.white,
              shape: const StadiumBorder(),
            ),
          )),
    );
  }

  Container containerJenisInfus() {
    return Container(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            const Text("Infus:", style: TextStyle(fontSize: 16)),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              child: ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20.0,
                activeBgColor: [globals.brown],
                activeFgColor: Colors.white,
                inactiveBgColor: const Color.fromARGB(31, 14, 12, 12),
                inactiveFgColor: Colors.black54,
                initialLabelIndex: globals.infus,
                totalSwitches: 3,
                labels: globals.arrInfus,
                radiusStyle: true,
                onToggle: (index) {
                  globals.infus = index!;
                },
              ),
            ),
          ],
        ));
  }

  Container containerGrade() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 18.0),
            child: const Text("Grade:", style: TextStyle(fontSize: 16)),
          ),
          const Spacer(),
          ToggleSwitch(
            minWidth: 90.0,
            cornerRadius: 20.0,
            activeBgColor: [globals.brown],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.black12,
            inactiveFgColor: Colors.black54,
            initialLabelIndex: globals.grade,
            totalSwitches: 2,
            labels: globals.arrGrade,
            radiusStyle: true,
            onToggle: (index) {
              globals.grade = index!;
            },
          ),
        ],
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
                    child: const Text('Oke'),
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
