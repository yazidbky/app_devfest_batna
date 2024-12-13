import 'package:app_devfest_batna/components/logo.dart';
import 'package:app_devfest_batna/components/main_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Services',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      decorationColor: mainColor,
                      decorationThickness: 3,
                    ),
                  ),
                  TextSpan(
                    text: ' We Offer',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              serviceCard('Web Development',
                  'We offer web development services', logoPath),
              serviceCard('Web Development',
                  'We offer web development services', logoPath),
              serviceCard('Web Development',
                  'We offer web development services', logoPath),
              const SizedBox(width: 20),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30),
              Numbers('100', 'Projects Completed'),
              Numbers('100', 'Projects Completed'),
              Numbers('100', 'Projects Completed'),
              const SizedBox(width: 30),
            ],
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(
              10,
              (index) => ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 3 - 30,
                ),
                child: PeopleSaying(
                  CircleAvatar(
                    backgroundImage: AssetImage(logoPath),
                  ),
                  'John Doe',
                  'CEO, Company',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                      'Ut enim ad minim veniam.'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                      'Ut enim ad minim veniam.'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                      'Ut enim ad minim veniam.',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceCard(String title, String description, String image) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Flexible(
            child: Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget Numbers(String number, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget PeopleSaying(CircleAvatar pic, String title, subTitle, description) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: pic,
            title: Text(
              title,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            subtitle: Text(
              subTitle,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
