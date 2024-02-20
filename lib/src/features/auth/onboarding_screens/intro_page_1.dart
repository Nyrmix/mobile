import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exxx/src/constants/image_strings.dart';
import 'package:exxx/src/constants/colors.dart';


class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Image.asset(onBoardingImage1),
          const SizedBox(
            height: 50,
          ),
          Text(
              'Easy Tracking',
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