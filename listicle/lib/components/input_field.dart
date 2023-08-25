import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelString;
  final String hintString;
  final bool isPass;

  const TextInputField(
      {super.key,
      required this.textEditingController,
      required this.labelString,
      required this.hintString,
      this.isPass = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 14),
      decoration: InputDecoration(
        labelText: labelString,
        hintText: hintString,
        labelStyle: GoogleFonts.montserrat(
            color: const Color.fromRGBO(79, 99, 172, 1),
            fontWeight: FontWeight.w500,
            fontSize: 14),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Color.fromRGBO(141, 155, 181, 1)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Color.fromRGBO(79, 99, 172, 1)),
        ),
      ),
    );
  }
}
