import 'package:flutter/material.dart';
import 'package:exxx/src/constants/image_strings.dart';
import 'package:exxx/src/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';



class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Image.asset(onBoardingImage2),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Flexible Payment',
            style: GoogleFonts.roboto(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}