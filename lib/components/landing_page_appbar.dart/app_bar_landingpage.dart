import 'dart:ui';

import 'package:app_devfest_batna/components/logo.dart';
import 'package:app_devfest_batna/components/main_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget? landingPageAppBar = AppBar(
  backgroundColor: mainColor,
  actions: [
    ConstrainedBox(
      constraints:
          const BoxConstraints(maxWidth: 1200), // Adjust max width as needed
      child: Row(
        children: [
          Image.asset(
            logoPath,
            color: Colors.white,
          ),
          Spacer(),
          // Add your text buttons
          TextButton(
            onPressed: () {},
            child: Text(
              'Overview',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Dashboard',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Analytics',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forecasting',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Logistics',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Marketplace',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Finance',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          // Icons for search and notifications
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[700],
                    child: const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.white,
                    ), // Adjusted icon size
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[700],
                    child: const Icon(
                      Icons.notifications,
                      size: 20,
                      color: Colors.white,
                    ), // Adjusted icon size
                  ),
                ),
              ),
            ],
          ),
          // Adjust the ListTile in a Container with spacing
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(100),
                ),
                width: 150, // Adjust the width to fit the ListTile properly
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.blue[700],
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          'Taha',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        )),
                        Center(
                            child: Text(
                          'Taha',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        )),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    ),
  ],
  centerTitle: false,
);
