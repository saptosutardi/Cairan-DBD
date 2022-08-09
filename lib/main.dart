import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cairan DBD',
      home: const MyHomePage(title: 'Perhitungan Carian DBD'),
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get groupValue => null;
  bool _obes = true;
  Color brown = const Color.fromARGB(255, 145, 39, 0);
  double weight = 0;
  // String needed = 'Isotonik (RL): \189 ml/jam =';

  var arrGrade = ['I atau II', 'III atau IV'];
  var arrInfus = const ['Makro-15', 'Makro-20', 'Mikro-60'];
  final etWeightHolder = TextEditingController();
  final etHeight = TextEditingController();
  int? grade;
  int? infus;
  int? idealWeight;
  int visibleRecomendation = 0;
  int need = 0;
  int dpm = 0;
  String sDPM = "";
  String result = '';
  var sWeight = "Berat Badan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFBFA),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Cairan ',
              style: TextStyle(color: Colors.black87), //<-- SEE HERE
            ),
            Text(
              'DBD',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            )
            // style: GoogleFonts.lato(fontStyle: FontStyle.italic)),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_outlined,
                color: Colors.black45),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Expanded(
                    child: AlertDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      backgroundColor: const Color(0xFFF4DDDC),
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
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () {},
                          child: const Text('Instagram'),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () {},
                          child: const Text('Oke'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        //margin: const EdgeInsets.all(0.0),
        color: const Color.fromRGBO(255, 251, 251, 100),
        padding: const EdgeInsets.all(8.0),
        child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically.
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                color: const Color(0xFFF4DDDC),
                clipBehavior: Clip.antiAlias,
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              // WEIGHT
                              child: TextField(
                                // controller: etWeightHolder,
                                controller: etWeightHolder,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 145, 39, 0),
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 145, 39, 0),
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 145, 39, 0)),
                                  labelText: "Berat Badan",
                                  counterText: "",
                                  suffix: Text('kg'),
                                ),
                              ),
                            ),

                            // OBES
                            Container(
                              height: 40,
                              margin: const EdgeInsets.only(left: 8),
                              child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() => _obes = !_obes);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext contex) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "Menghitung BB ideal:"),
                                              content: TextField(
                                                onChanged: (value) {},
                                                controller: etHeight,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "Tinggi Badan (cm)",
                                                  suffix: Text('cm'),
                                                ),
                                                maxLength: 4,
                                              ),
                                              // TextButton(onPressed: (){}, child: Text("OK"))
                                              actions: <Widget>[
                                                TextButton(
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.red),
                                                  ),
                                                  onPressed: () {
                                                    double? ideal =
                                                        idealWeightCalc(
                                                            etHeight);
                                                    int idealInt =
                                                        ideal.toInt();
                                                    etWeightHolder.text =
                                                        idealInt.toString();
                                                    Navigator.pop(
                                                        context, 'Oke');
                                                  },
                                                  child: const Text('Oke'),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    icon: Image.asset(
                                      'assets/fat_man.png',
                                      height: 18,
                                      width: 18,
                                      color:
                                          _obes ? Colors.black45 : Colors.white,
                                    ),
                                    label: const Text('Obesitas'),
                                    style: ElevatedButton.styleFrom(
                                      primary: _obes ? Colors.black12 : brown,
                                      shadowColor: Colors.black12,
                                      onPrimary:
                                          _obes ? Colors.black54 : Colors.white,
                                      shape: const StadiumBorder(),
                                    ),
                                  )),
                            ),
                          ],
                        ),

                        // GRADE
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: const Text("Grade:"),
                              ),
                              const Spacer(),
                              ToggleSwitch(
                                minWidth: 90.0,
                                cornerRadius: 20.0,
                                activeBgColor: [brown],
                                activeFgColor: Colors.white,
                                inactiveBgColor: Colors.black12,
                                inactiveFgColor: Colors.black54,
                                initialLabelIndex: grade,
                                totalSwitches: 2,
                                labels: arrGrade,
                                radiusStyle: true,
                                onToggle: (index) {
                                  grade = index!;
                                },
                              ),
                            ],
                          ),
                        ),

                        // JENIS INFUS
                        Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                const Text("Infus:"),
                                const Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  child: ToggleSwitch(
                                    minWidth: 90.0,
                                    cornerRadius: 20.0,
                                    activeBgColor: [brown],
                                    activeFgColor: Colors.white,
                                    inactiveBgColor:
                                        const Color.fromARGB(31, 14, 12, 12),
                                    inactiveFgColor: Colors.black54,
                                    initialLabelIndex: infus,
                                    totalSwitches: 3,
                                    labels: arrInfus,
                                    radiusStyle: true,
                                    onToggle: (index) {
                                      infus = index!;
                                    },
                                  ),
                                ),
                              ],
                            )),

                        const Divider(color: Colors.brown),

                        // CALCULATION
                        Row(
                          children: [
                            const Spacer(),
                            // KOSONGKAN
                            Container(
                              height: 36,
                              margin: const EdgeInsets.only(right: 8.0),
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    grade = null;
                                    infus = null;
                                    etWeightHolder.text = "";
                                    visibleRecomendation = 0;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.red,
                                  side: const BorderSide(color: Colors.red),
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text('Kosongkan'),
                              ),
                            ),
                            SizedBox(
                                height: 36,
                                child: ElevatedButton(
                                  onPressed: getTextInputData0,
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      shape: const StadiumBorder()),
                                  child: const Text('Hitung'),
                                )),
                          ],
                        )
                      ],
                    )),
              ),

              Container(
                margin: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: <Widget>[
                    if (visibleRecomendation == 1)
                      const Text(
                          'REKOMENDASI:'), // Only visible if condition is true
                  ],
                ),
              ),

              // REKOMENDASI
              Column(
                children: <Widget>[
                  if (visibleRecomendation == 1)
                    Card(
                      color: const Color(0xFFF4DDDC),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              // mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  "INFUS:",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Row(children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: const Icon(
                                      Icons.play_circle,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Text("Isotonik (RL): \n$need ml/jam = "),
                                ]),

                                const Spacer(),

                                // TPM = DPM
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(children: [
                                      Text(
                                        sDPM,
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 28),
                                      ),
                                      Container(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: const Text('TPM'))
                                    ])),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              )
            ]),
      ),
    );
  }

  Widget buildSegment(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black),
    );
  }

  void getTextInputData0() {
    setState(() {
      result = etWeightHolder.text;
      if (result.isNotEmpty) {
        getTextInputData();
      } else {
        showDialog(
            context: context,
            builder: (BuildContext contex) {
              return AlertDialog(
                title: const Text("Perhatikan..."),
                content: const Text("Silakan mengisi form dengan lengkap!"),
                actions: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('Oke'),
                  ),
                ],
              );
            });
      }
    });
  }

  void getTextInputData() {
    setState(() {
      result = etWeightHolder.text;
      visibleRecomendation = 1;

      int wg = int.parse(result);
      if (grade == 0) {
        if (wg < 15) {
          need = (wg * 7).toInt();
        } else if (wg > 40) {
          need = (wg * 3).toInt();
        } else {
          need = (wg * 5).toInt();
        }
      } else {
        need = (wg * 20).toInt();
      }

      int dropFac;
      if (infus == 0) {
        dropFac = 15;
      } else if (infus == 1) {
        dropFac = 20;
      } else {
        dropFac = 60;
      }

      dpm = (need * dropFac) ~/ 60; //((need*dropFac)/60).toInt();
      sDPM = dpm.toString();
    });
  }

  double idealWeightCalc(TextEditingController etHeight) {
    double height = double.parse(etHeight.text); // in cm
    double idealBMI = 22;
    double idealWg = height * height * idealBMI / 10000;
    return idealWg;
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        debugPrint('Received click');
      },
      child: const Text('Click Me'),
    );
  }
}
