import 'package:flutter/material.dart';

class SalesInvestorScreen extends StatefulWidget {
  const SalesInvestorScreen({super.key});

  @override
  State<SalesInvestorScreen> createState() => _SalesInvestorScreenState();
}

class _SalesInvestorScreenState extends State<SalesInvestorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Investor Screen'),
      ),
    );
  }
}
