import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class CalculationMethod extends StatefulWidget {
  const CalculationMethod({Key? key}) : super(key: key);

  @override
  State<CalculationMethod> createState() => _CalculationMethodState();
}

class _CalculationMethodState extends State<CalculationMethod> {
  @override
  Widget build(BuildContext context) {
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
