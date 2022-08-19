import 'globals.dart' as globals;
import 'package:flutter/material.dart';

class ObeseDialog extends StatelessWidget {
  const ObeseDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: globals.pink,
      title: const Text("Menghitung BB ideal*:"),
      content: Wrap(
        children: [
          TextField(
            controller: globals.etHeight,
            maxLength: 4,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 145, 39, 0), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 145, 39, 0), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              labelStyle: TextStyle(color: Color.fromARGB(255, 145, 39, 0)),
              labelText: "Tinggi Badan (cm)",
              counterText: "",
              suffix: Text('cm'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Flexible(
                child: Text(
                    "*Khusus pasien Obesitas yang dihitung adalah BB idealnya, bukan BB sekarang",
                    style: TextStyle(fontSize: 12, color: Colors.black54))),
          )
        ],
      ),

      // TextButton(onPressed: (){}, child: Text("OK"))
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          // onPressed: () => Navigator.pop(context, 'Cancel'),
          onPressed: () {},
          child: const Text('Batal'),
        ),
        TextButton(
          style: ButtonStyle(
            //
            foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          onPressed: () {
            double? ideal = idealWeightCalc(globals.etHeight);
            int idealInt = ideal.toInt();
            globals.idealWeight = idealInt;
            globals.obes = true;
            globals.etWeightHolder.text = globals.idealWeight.toString();
            Navigator.of(context).pop(idealInt);
          },
          child: const Text('Oke'),
        ),
      ],
    );
  }

  double idealWeightCalc(TextEditingController etHeight) {
    double height = double.parse(etHeight.text); // in cm
    double idealBMI = 22;
    double idealWg = height * height * idealBMI / 10000;
    return idealWg;
  }
}
