import 'package:app_devfest_batna/registre%20and%20login/login.dart';
import 'package:app_devfest_batna/startUp%20ui/home.dart';
import 'package:app_devfest_batna/startUp%20ui/quick_access.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
