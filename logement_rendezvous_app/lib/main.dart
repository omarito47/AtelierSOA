import 'package:flutter/material.dart';
import 'package:logement_rendezvous_app/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logements & Rendez-vous',
      home: HomePage(),
    );
  }
}
