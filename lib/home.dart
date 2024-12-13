import 'package:app_devfest_batna/components/home%20components/app_bar.dart';
import 'package:app_devfest_batna/components/home%20components/front_design.dart';
import 'package:app_devfest_batna/components/home%20components/services.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [FrontDesign(), Services()],
          ),
        ),
      ),
    );
  }
}
