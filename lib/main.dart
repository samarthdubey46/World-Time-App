import 'package:flutter/material.dart';
import 'package:Test/Screens/homs.dart';
import 'package:Test/Screens/Locations.dart';
import 'package:Test/Screens/Loading.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/locations': (context) => Locations(),
      },
    );
  }
}
