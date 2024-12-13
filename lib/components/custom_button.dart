import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color, textColor;
  final Color borderColor;
  final void Function()? onPressed;
  final double? size, height;

  const CustomButton(
      {super.key,
      required this.text,
      this.color,
      required this.borderColor,
      this.textColor,
      required this.onPressed,
      this.size,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: borderColor)),
        minWidth:
            MediaQuery.of(context).size.width * (size != null ? size! : 0.9),
        height: 50,
        color: color,
        child: Text(text,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal, color: textColor)),
      ),
    );
  }
}
