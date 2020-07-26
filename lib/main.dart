import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:live_vend/routes.dart';
import 'package:live_vend/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveVend',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      routes: routes,
    );
  }
}
