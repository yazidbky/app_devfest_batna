import 'package:app_devfest_batna/components/custom_button.dart';
import 'package:app_devfest_batna/components/landing_page_appbar.dart/app_bar_landingpage.dart';
import 'package:app_devfest_batna/components/main_color.dart';
import 'package:app_devfest_batna/registre%20and%20login/login_investor.dart';
import 'package:app_devfest_batna/startUp%20ui/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandinPageUser extends StatefulWidget {
  const LandinPageUser({super.key});

  @override
  State<LandinPageUser> createState() => _LandinPageUserState();
}

class _LandinPageUserState extends State<LandinPageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: landingPageAppBar,
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1E94FD), // First color
                  Color(0xFF294DFF), // Second color
                ],
              ),
            ),
          ),
          // Background image
          Positioned.fill(
            child: Image.asset(
              'images/circles.png',
              fit: BoxFit.cover,
              color: mainColor, // Optional tint
            ),
          ),
          // Center content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'images/Hero Container.png',
                  fit: BoxFit.cover,
                  height: 200, // Adjust size as needed
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Get Started',
                borderColor: mainColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                },
                color: mainColor,
                size: 0.1,
                textColor: Colors.white,
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
          // Bottom content
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn('99K', 'People have joined us'),
                    _buildSeparator(),
                    _buildStatColumn('50+', 'Countries reached'),
                    _buildSeparator(),
                    _buildStatColumn('10M', 'Users active daily'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String description) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSeparator() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.grey.shade300,
    );
  }
}
