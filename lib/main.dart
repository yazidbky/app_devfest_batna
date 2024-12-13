import 'package:app_devfest_batna/responsive/desktop_layout.dart';
import 'package:app_devfest_batna/responsive/mobile_body.dart';
import 'package:app_devfest_batna/responsive/responsive_layout.dart';
import 'package:app_devfest_batna/responsive/tablet_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveLayout(
        mobileBody: const MobileScaffold(),
        tabletBody: const TabletScaffold(),
        desktopBody: const DesktopScaffold(),
      ),
    );
  }
}
