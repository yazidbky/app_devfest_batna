import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text, hintText;

  CustomTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Align text to the left and give it the same width as the TextField
        Padding(
          padding: const EdgeInsets.only(left: 120),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 8), // Adjusted spacing for better alignment
        // Decreased width for the TextField
        SizedBox(
          width:
              MediaQuery.sizeOf(context).width * 0.4, // Decrease width to 50%
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
        const SizedBox(height: 30), // Adjusted bottom spacing
      ],
    );
  }
}
