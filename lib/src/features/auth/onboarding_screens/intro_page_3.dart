import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exxx/src/constants/colors.dart';
import 'package:exxx/src/constants/image_strings.dart';


class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Image.asset(onBoardingImage3),
          const SizedBox(
            height: 50,
          ),
          Text(
              'Real-time Tracking',
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