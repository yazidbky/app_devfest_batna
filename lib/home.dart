import 'package:app_devfest_batna/components/custom_button.dart';
import 'package:app_devfest_batna/components/home%20components/app_bar.dart';
import 'package:app_devfest_batna/components/home%20components/front_design.dart';
import 'package:app_devfest_batna/components/home%20components/services.dart';
import 'package:app_devfest_batna/components/logo.dart';
import 'package:app_devfest_batna/components/main_color.dart';
import 'package:app_devfest_batna/registre%20and%20login/login.dart';
import 'package:app_devfest_batna/registre%20and%20login/registre.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 1200), // Adjust max width as needed
            child: Row(
              children: [
                Image.asset(logoPath),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Products',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Price',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Learn',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Support',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
                CustomButton(
                  text: 'Get Started',
                  borderColor: mainColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registre(),
                        ));
                  },
                  size: 0.1,
                  height: 60,
                ),
              ],
            ),
          ),
        ],
        centerTitle: false,
      ),
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
