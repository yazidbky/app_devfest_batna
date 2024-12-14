import 'package:app_devfest_batna/components/custom_button.dart';
import 'package:app_devfest_batna/components/main_color.dart';
import 'package:app_devfest_batna/registre%20and%20login/login_investor.dart';
import 'package:app_devfest_batna/registre%20and%20login/registre.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FrontDesign extends StatelessWidget {
  const FrontDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'One Platfrom',
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            'Empower Your\nBusiness',
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            'Harness data-driven intelligence, seamless logistics\nand collaborative solutions to drive growth and efficiency',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.black,
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
            color: mainColor,
            size: 0.1,
            textColor: Colors.white,
            height: 60,
          ),
          CustomButton(
            text: 'For Investor',
            borderColor: mainColor,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPageForInvestor(),
                  ));
            },
            color: Colors.white,
            size: 0.1,
            textColor: mainColor,
          ),
        ],
      ),
    );
  }
}
