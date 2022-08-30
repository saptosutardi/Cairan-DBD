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
var signSymp = "Gejala dan Tanda:";
List<String> arrSignSymptomsDS = const [
  'Demam 2-7 hari, mendadak tinggi',
  'Perdarahan spontan: ruam kulit, perdarah gusi, dll',
  'Nyeri kepala, Nyeri otot & tulang',
  'Ada kasus DBD di sekitaran',
  'Lekosit ≤ 4.000 /mm³',
  'Trombosit < 150.000 /mm³',
];

List<String> arrSignSymptomsDBD = const [
  'Tanda kebocoran plasma',
  'Peningkatan hematokrit >20%',
  'Efusi pleura',
  'Asites',
  'Hipoalbunemia/Hiponatremia',
];

var arrValue = [false, false, false, false, false, false];
// var arrSignSympDBD1 =
final etWeightHolder = TextEditingController();
final etHeight = TextEditingController();
int? grade;
int? infus;
int? idealWeight;
bool? predic;
bool? isWeightTFFocused;
var visibleRecomendation = 0;
var need = 0;
var dpm = 0;
var title = "Cairan DBD";
var sDPM = "";
var dpmOrImmediately = "";
var result = '';
var ok = "Oke";
var cancel = "Batal";

var assessmentHeader = "Tinggal di/bepergian ke area endemik disertai demam";
List<String> arrAssessment = [
  "Mual dan muntah",
  "Ruam",
  "Nyeri dan pegal (nyeri kepala, nyeri mata, pegal otot, dan atau nyeri sendi",
  "Tanda bahaya",
  "Positif tes turniket",
  "Leukopenia"
];

List<String> arrWarningSign = [
  "Nyeri abdomen yang berat atau nyeri tekan",
  "Muntah terus-menerus",
  "Perdarahan mukosa",
  "Pembesaran hepar >2cm",
  "Akumulasi carian klinis",
  "Letargi, gelisah",
  "Peningkatan hematrokrit bersamaan dengan penururan cepat jumlah trombosit"
];

List<String> arrAddCondition = [
  "Bayi",
  "Diabetes melitus",
  "Penyakit jantung bawaan",
  "Penyakit paru kronik",
  "Kelainan hati kronik",
  "Penyakit hemolitik",
  "Gagal ginjal",
  "Kondisi sosial buruk"
];

List<String> arrCondisition = [
  "Kebocoran plasma berat dengan syok dan/atau akumulasi cairan dengan distres nafas",
  "Perdarahan berat",
  "Kegagalan organ berat"
];

final Uri url = Uri.parse('https://www.instagram.com/saptosutardi/');
