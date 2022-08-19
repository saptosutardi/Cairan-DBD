import 'globals.dart' as globals;
import 'package:flutter/material.dart';

class WeightTextField extends StatelessWidget {
  WeightTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var tap = globals.isWeightTFFocused;
    return Expanded(
      // WEIGHT
      child: TextField(
        /* onTap: () {
          tap = true;
          print('clicked');
          globals.obes = false;
        }, */
        controller: globals.etWeightHolder,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 145, 39, 0), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 145, 39, 0), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 145, 39, 0)),
          labelText:
              "Berat Badan (BB), obes: ${globals.obes == true ? 'Obes' : 'Tidak obes'}",
          // "Berat Badan (BB) ${globals.etWeightHolder.text.isNotEmpty ? 'Ideal' : ''}",
          // labelText: "Berat Badan (BB) : ${globals.idealWeight} = $tap ",
          counterText: "",
          suffix: const Text('kg'),
        ),
      ),
    );
  }
}
