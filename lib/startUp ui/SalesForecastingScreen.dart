import 'package:flutter/material.dart';

class SalesForecastingScreen extends StatefulWidget {
  const SalesForecastingScreen({super.key});

  @override
  State<SalesForecastingScreen> createState() => _SalesForecastingScreenState();
}

class _SalesForecastingScreenState extends State<SalesForecastingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Sales Screen'),
      ),
    );
  }
}
