library flutter_application_1.globals;

import 'package:flutter/material.dart';

get groupValue => null;
bool obes = true;
Color brown = const Color.fromARGB(255, 145, 39, 0);
Color pink = const Color(0xFFF4DDDC);
double weight = 0;
// String needed = 'Isotonik (RL): \189 ml/jam =';

var arrGrade = ['I atau II', 'III atau IV'];
var arrInfus = const ['Makro-15', 'Makro-20', 'Mikro-60'];
final etWeightHolder = TextEditingController();
final etHeight = TextEditingController();
int? grade;
int? infus;
int? idealWeight;
bool? predic;
int visibleRecomendation = 0;
int need = 0;
int dpm = 0;
String sDPM = "";
String dpmOrImmediately = "";
String result = '';
// var sWeight = ["Berat Badan", "Prediksi Berat Badan"];
final Uri url = Uri.parse('https://www.instagram.com/saptosutardi/');
