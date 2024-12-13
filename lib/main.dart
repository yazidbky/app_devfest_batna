import 'package:app_devfest_batna/home.dart';
import 'package:app_devfest_batna/user%20landing%20page/landin_page_user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LandinPageUser());
  }
}
