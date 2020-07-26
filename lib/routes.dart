import 'package:flutter/material.dart';
import 'package:live_vend/screens/login.dart';
import 'package:live_vend/screens/register.dart';

var routes = <String, WidgetBuilder>{
  '/login': (BuildContext context) => new Login(),
  '/register': (BuildContext context) => new Register(),
};