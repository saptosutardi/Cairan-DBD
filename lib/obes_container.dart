import 'package:KalkukatorDBD/obese_dialog.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class ObeseContainer extends StatefulWidget {
  const ObeseContainer({Key? key}) : super(key: key);

  @override
  State<ObeseContainer> createState() => _ObeseContainerState();
}

class _ObeseContainerState extends State<ObeseContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 8),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () async {
              // setState(() => globals.obes = !globals.obes);
              await showDialog(
                  context: context,
                  builder: (BuildContext contex) {
                    return const ObeseDialog();
                  });
              setState(() {});
            },
            icon: Image.asset(
              'assets/fat_man.png',
              height: 18,
              width: 18, //
              color: globals.obes ? Colors.white : Colors.black45,
            ),
            label: const Text('Obesitas'),
            style: ElevatedButton.styleFrom(
              primary: globals.obes ? globals.brown : Colors.black12,
              shadowColor: Colors.black12,
              onPrimary: globals.obes ? Colors.white : Colors.black54,
              shape: const StadiumBorder(),
            ),
          )),
    );
  }
}
