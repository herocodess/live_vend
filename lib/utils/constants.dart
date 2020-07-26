import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const whiteColor = Colors.white;
var bodyColor = Hexcolor("#110027");
var tfColor = Colors.grey;

bool isValidEmailAddress(String it) =>
    RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(it);