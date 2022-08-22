import 'package:flutter/cupertino.dart';
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
            switchSetting(arrSignSymptomsDS[0], arrValue[0]),
            // switchSetting(arrSignSymptomsDS[1], arrValue[1]),
            // switchSetting(arrSignSymptomsDS[2], arrValue[2]),
            // switchSetting(arrSignSymptomsDS[3], arrValue[3]),
            // switchSetting(arrSignSymptomsDS[4], arrValue[4]),
            // switchSetting(arrSignSymptomsDS[5], arrValue[5]),
            ListTile(
              title: Text(arrSignSymptomsDS[0]),
              trailing: CupertinoSwitch(
                value: arrValue[0],
                onChanged: (val) {
                  setState(() => arrValue[0] = val);
                },
              ),
              onTap: () {
                setState(() {
                  arrValue[0] = !arrValue[0];
                });
              },
            ),
            buildSwitchListTile(
                Title: arrSignSymptomsDS[1],
                Value: arrValue[1],
                onChanged: (val) => setState(() => arrValue[1] = val)),
            buildSwitchListTile(
                Title: arrSignSymptomsDS[2],
                Value: arrValue[2],
                onChanged: (val) => setState(() => arrValue[2] = val)),
            buildSwitchListTile(
                Title: arrSignSymptomsDS[3],
                Value: arrValue[3],
                onChanged: (val) => setState(() => arrValue[3] = val)),
            buildSwitchListTile(
                Title: arrSignSymptomsDS[4],
                Value: arrValue[4],
                onChanged: (val) => setState(() => arrValue[4] = val)),
            buildSwitchListTile(
                Title: arrSignSymptomsDS[5],
                Value: arrValue[5],
                onChanged: (val) => setState(() => arrValue[5] = val)),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(child: Text(globals.cancel), onPressed: () {}),
        TextButton(child: Text(globals.ok), onPressed: () {}),
      ],
    );
  }

  SwitchListTile buildSwitchListTile({
    required String Title,
    required bool Value,
    required void Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(Title),
      value: Value,
      onChanged: onChanged,
    );
  }

  ListTile switchSetting(String arrSignSymptomsDS, bool arrValue) {
    return ListTile(
      title: Text(arrSignSymptomsDS),
      trailing: CupertinoSwitch(
        value: arrValue,
        onChanged: (val) {
          setState(() => arrValue = val);
        },
      ),
      onTap: () {
        setState(() {
          arrValue = !arrValue;
        });
      },
    );
  }
}
