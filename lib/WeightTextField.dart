import 'globals.dart' as globals;
import 'package:flutter/material.dart';

class WeightTextField extends StatelessWidget {
  WeightTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // WEIGHT
      child: TextField(
        // controller: etWeightHolder,
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
          // labelText:
          // "Berat Badan (BB) ${globals.etWeightHolder.text.isNotEmpty ? 'Ideal' : ''}",

          labelText: "Berat Badan (BB) : ${globals.idealWeight}",
          counterText: "",
          suffix: const Text('kg'),
        ),
      ),
    );
  }
}
