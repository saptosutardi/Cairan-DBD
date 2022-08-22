// import 'package:flutter/cupertino.dart';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class GradeDialog extends StatefulWidget {
  const GradeDialog({Key? key}) : super(key: key);

  @override
  State<GradeDialog> createState() => _GradeDialogState();
}

class _GradeDialogState extends State<GradeDialog> {
  bool lights = false;
  int count = globals.arrSignSymptomsDS.length;
  var arrSignSymptomsDS = globals.arrSignSymptomsDS;
  var arrValue = globals.arrValue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: globals.pink,
      title: Text(globals.signSymp),
      content: SizedBox(
        // width: double.maxFinite,
        child: Column(
          children: <Widget>[
            SwitchListTile(
                title: Text(arrSignSymptomsDS[0]),
                value: arrValue[0],
                onChanged: (val) => setState(() => arrValue[0] = val)),
            SwitchListTile(
                title: Text(arrSignSymptomsDS[1]),
                value: arrValue[1],
                onChanged: (val) => setState(() => arrValue[1] = val)),
            SwitchListTile(
                title: Text(arrSignSymptomsDS[2]),
                value: arrValue[2],
                onChanged: (val) => setState(() => arrValue[2] = val)),
            SwitchListTile(
                title: Text(arrSignSymptomsDS[3]),
                value: arrValue[3],
                onChanged: (val) => setState(() => arrValue[3] = val)),
            SwitchListTile(
                title: Text(arrSignSymptomsDS[4]),
                value: arrValue[4],
                onChanged: (val) => setState(() => arrValue[4] = val)),
            SwitchListTile(
                title: Text(arrSignSymptomsDS[5]),
                value: arrValue[5],
                onChanged: (val) => setState(() => arrValue[5] = val)),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            child: Text(globals.cancel),
            onPressed: () {
              Navigator.of(context, rootNavigator: false).pop();
              for (int i = 0; i < arrValue.length; i++) {
                arrValue[i] = false;
              }
            }),
        TextButton(
            child: Text(globals.ok),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              // ignore: avoid_print
              print(arrValue);
            }),
      ],
    );
  }
}
