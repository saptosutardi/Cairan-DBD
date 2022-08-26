// import 'package:flutter/cupertino.dart';
// import 'dart:ffi';

import 'package:parent_child_checkbox/parent_child_checkbox.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'dart:developer';

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
          width: double.maxFinite,
          child: Column(
            children: [
              ParentChildCheckbox(
                parent: Text("Demam 2-7 hari"),
                children: [],
              ),
              ParentChildCheckbox(
                parent: Text("Perdarahan spontan"),
                children: [
                  // setText("Uji Tourniquet Positif", "Petekie", "Epistaksis","Hemetameisis/Melena");
                  Text("Uji Tourniquet Positif"),
                  Text("Petekie"),
                  Text("Epistaksis"),
                  Text("Hemetameisis/Melena"),
                ],
              ),
              ParentChildCheckbox(
                parent: Text('Kasus DBD sekitar lingkungan'),
                children: [],
              ),
              ParentChildCheckbox(
                parent: Text('Nyeri'),
                children: [
                  Text("Kepala"),
                  Text("Retroorbital"),
                  Text("artra"),
                ],
              ),
              ParentChildCheckbox(
                parent: Text('Leukosit <4.000'),
                children: [],
              ),
              ParentChildCheckbox(
                parent: Text('Trombositopenia'),
                children: [
                  Text("<100.000>"),
                  Text("Efusi plaura atau aisies"),
                  Text("Hemetameisis/Melena"),
                ],
              ),
              ParentChildCheckbox(
                parent: Text("Kebocoran Plasma"),
                children: [
                  Text("Hematokrit >20%"),
                  Text("Efusi plaura atau aisies"),
                  Text("Hemetameisis/Melena"),
                ],
              ),
              ParentChildCheckbox(
                parent: Text("Perdarahan spontan"),
                children: [
                  Text("Uji Tourniquet Positif"),
                  Text("Petekie"),
                  Text("Epistaksis"),
                  Text("Hemetameisis/Melena"),
                ],
              ),
              ParentChildCheckbox(
                parent: Text("Tanda bahaya"),
                children: [
                  Text("Demam turun, tapi keadaan memburuk"),
                  Text("Nyeri perut"),
                  Text("Muntah menetap"),
                  Text("Letargi, gelisah"),
                  Text("Perdarahan mukosa"),
                  Text("Pembesaran hati"),
                  Text("Akumulasi cairan"),
                  Text("Oliguria"),
                ],
              ),
              ElevatedButton(
                child: Text('Get Data'),
                onPressed: () {
                  log(ParentChildCheckbox.isParentSelected.toString());
                  log(ParentChildCheckbox.selectedChildrens.toString());
                },
              ),
            ],
          )

          /*checkBoxRegularly() */
          ),
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
  
  setText(String s, String t, String u, String v) {
    for(int i=0; i)
  }
}
