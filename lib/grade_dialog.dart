// import 'package:flutter/cupertino.dart';
// import 'dart:ffi';

// import 'package:parent_child_checkbox/parent_child_checkbox.dart';
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
  var arrSignSymptomsDS = globals.arrAssessment;
  var arrValue = globals.arrValue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: globals.pink,
      title: Text(globals.signSymp),
      content: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [checkBoxRegularly()],
          )),
      actions: <Widget>[
        TextButton(
            child: Text(
              globals.cancel,
              style: const TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: false).pop();
              for (int i = 0; i < arrValue.length; i++) {
                arrValue[i] = false;
              }
            }),
        TextButton(
            child: Text(
              globals.ok,
              style: const TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              // ignore: avoid_print
              print(arrValue);
              clasificationDengue(arrValue);
            }),
      ],
    );
  }

  void clasificationDengue(List<bool> arrValue) {
    var addSignSymp = arrValue.sublist(1);
    var value = addSignSymp.where((item) => item == true).length;
    print(value.toString());
    if (value > 1)
      print("kasus DBD");
    else
      print("bukan DBD");
  }

  checkBoxRegularly() {
    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: arrSignSymptomsDS.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(arrSignSymptomsDS[index]),
              value: arrValue[index],
              onChanged: (val) => setState(() => arrValue[index] = val!),
              // secondary: const Icon(Icons.hourglass_empty),
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        )
      ],
    );
  }
}
