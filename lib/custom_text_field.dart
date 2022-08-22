import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Color color;
  const CustomTextField(
      {Key? key,
      this.color = Colors.grey,
      String? labelText,
      required TextEditingController controller,
      required String counterText,
      required Text suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String labelText = "fjakf";
    var textField = const TextField(
        maxLength: 4,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 145, 39, 0), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 145, 39, 0), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          labelStyle: TextStyle(color: Color.fromARGB(255, 145, 39, 0)),
          // labelText: labelText,
          counterText: "",
          suffix: Text('kg'),
        ));
    return textField;
  }
}
