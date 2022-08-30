import 'package:KalkukatorDBD/grade_dialog.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'globals.dart' as globals;

class ContainerGrade extends StatefulWidget {
  const ContainerGrade({Key? key}) : super(key: key);

  @override
  State<ContainerGrade> createState() => _ContainerGradeState();
}

class _ContainerGradeState extends State<ContainerGrade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.only(right: 18.0),
              child: Row(
                children: [
                  const Text("Grade:", style: TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.help),
                    color: Colors.red,
                    onPressed: () {
                      _showDialog(3);
                      /* await showDialog(
                          context: context,
                          builder: (BuildContext contex) {
                            return const GradeDialog();
                            // return full_screen_dialog();
                          }); */
                      // setState(() {});
                    },
                  )
                ],
              )),
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

  /*  void _showDialog(int count) async {
    if (count <= 0) {
      return;
    } else {
      await showDialog(context: context, builder: (_) => AlertDialog(
        
      ));
      _showDialog(--count);
    }
  } */
}
