import 'package:flutter/material.dart';
import 'package:flutter_application_1/ObeseDialog.dart';
import 'globals.dart' as globals;

class ObeseContainer extends StatefulWidget {
  const ObeseContainer(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<ObeseContainer> createState() => ObeseContainerState();
}

class ObeseContainerState extends State<ObeseContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 8),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () async {
              setState(() => globals.obes = !globals.obes);
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
              width: 18,
              color: globals.obes ? Colors.black45 : Colors.white,
            ),
            label: const Text('Obesitas'),
            style: ElevatedButton.styleFrom(
              primary: globals.obes ? Colors.amber : globals.brown,
              shadowColor: Colors.blue,
              onPrimary: globals.obes ? Colors.black54 : Colors.white,
              shape: const StadiumBorder(),
            ),
          )),
    );
  }
}
