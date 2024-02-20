import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intro_page_1.dart';
import 'intro_page_2.dart';
import 'intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/src/constants/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OnBoarding();
  }
}

class _OnBoarding extends State<OnBoarding> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        onLastPage
            ? Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 700),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/session_2/register');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          fixedSize: const Size(346, 50)),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',
                            style: GoogleFonts.roboto(
                              color: grayColorDark,
                              fontSize: 14,
                            )),
                        Text('Sign in',
                            style: GoogleFonts.roboto(
                              color: primaryColor,
                              fontSize: 14,
                            )),
                      ],
                    )
                  ],
                ),
              )
            : Container(
                alignment: const Alignment(0, 0.9),
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        _controller.jumpToPage(2);
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      child: const Text('Skip', style: TextStyle( color: Color(0xFF0560FA)),),
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const SwapEffect(
                        activeDotColor: primaryColor,
                        dotColor: grayColorDark,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text('Next', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              )
      ],
    ));
  }
}
