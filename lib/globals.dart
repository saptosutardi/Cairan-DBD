library flutter_application_1.globals;

import 'package:flutter/material.dart';

get groupValue => null;
bool obes = false;
Color brown = const Color.fromARGB(255, 145, 39, 0);
Color pink = const Color(0xFFF4DDDC);
double weight = 0;
// String needed = 'Isotonik (RL): \189 ml/jam =';

var arrGrade = ['I atau II', 'III atau IV'];
var arrInfus = const ['Makro-15', 'Makro-20', 'Mikro-60'];
var signSymp = "Gejala dan Tanda";
var arrSignSymptomsDS = const [
  'Demam 2-7 hari, mendadak tinggi',
  'Perdarahan spontan: ruam kulit, perdarah gusi, dll',
  'Nyeri kepala, Nyeri otot & tulang',
  'Ada kasus DBD di sekitaran',
  'Lekosit ≤ 4.000 /mm³',
  'Trombosit < 150.000 /mm³',
];

var arrValue = [true, false, true, false, false, false];
// var arrSignSympDBD1 =
final etWeightHolder = TextEditingController();
final etHeight = TextEditingController();
int? grade;
int? infus;
int? idealWeight;
bool? predic;
bool? isWeightTFFocused;
int visibleRecomendation = 0;
int need = 0;
int dpm = 0;
var title = "Cairan DBD";
var sDPM = "";
var dpmOrImmediately = "";
var result = '';
var signSymptoms = "Gejala dan Tanda:";
var ok = "Oke";
var cancel = "Batal";

final Uri url = Uri.parse('https://www.instagram.com/saptosutardi/');
