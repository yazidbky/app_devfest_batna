import 'package:app_devfest_batna/startUp%20ui/web_sidebar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _QuickAccessState();
}

class _QuickAccessState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebSidebar(),
      ],
    );
  }
}
