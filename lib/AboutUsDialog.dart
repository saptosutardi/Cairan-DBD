import 'package:url_launcher/url_launcher.dart';

import 'globals.dart' as globals;
import 'package:flutter/material.dart';

class AboutUsDialog extends StatelessWidget {
  const AboutUsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      backgroundColor: globals.pink, //
      title: const Text('Tentang Aplikasi ini'),
      content: Row(children: [
        Container(
            margin: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/foto_2.jpg',
                height: 120,
              ),
            )),
        const Flexible(
          child: Text(
            "Aplikasi ini dibuat:\ndr. Sapto Sutardi\n[Lombok Barat-NTB].\nRujukan: PMK No. HK.01.07/Menkes/1186/2022 Tentang Panduan Praktik Klinis bagi Dokter di Faskes Tingkat Pertama",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ]),
      actions: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          onPressed: _launchUrl,
          child: const Text('Instagram'),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Oke'),
        ),
      ],
    ));
  }

  void _launchUrl() {
    launchUrl(Uri.parse(globals.url.toString()));
  }
}
