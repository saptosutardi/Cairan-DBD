import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'globals.dart' as globals;

class InfusKind extends StatefulWidget {
  const InfusKind({Key? key}) : super(key: key);

  @override
  State<InfusKind> createState() => _InfusKindState();
}

class _InfusKindState extends State<InfusKind> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            const Text("Infus:", style: TextStyle(fontSize: 16)),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              child: ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20.0,
                activeBgColor: [globals.brown],
                activeFgColor: Colors.white,
                inactiveBgColor: const Color.fromARGB(31, 14, 12, 12),
                inactiveFgColor: Colors.black54,
                initialLabelIndex: globals.infus,
                totalSwitches: 3,
                labels: globals.arrInfus,
                radiusStyle: true,
                onToggle: (index) {
                  globals.infus = index!;
                },
              ),
            ),
          ],
        ));
  }
}
