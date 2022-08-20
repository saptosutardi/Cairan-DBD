import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class GradeDialog extends StatefulWidget {
  const GradeDialog({Key? key}) : super(key: key);

  @override
  State<GradeDialog> createState() => _GradeDialogState();
}

class _GradeDialogState extends State<GradeDialog> {
  @override
  Widget build(BuildContext context) {
    bool lights = false;
    return AlertDialog(
        backgroundColor: globals.pink,
        title: Text(globals.signSymptoms),
        content: MergeSemantics(
          child: ListTile(
            title: const Text('Lights'),
            trailing: CupertinoSwitch(
              value: lights,
              onChanged: (bool value) {
                setState(() {
                  lights = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                lights = !lights;
              });
            },
          ),
        ));
  }
}
