import 'package:flutter/material.dart';
import 'src/features/auth/splash_screen/splash_screen.dart';
import 'src/features/auth/onboarding_screens/onboarding.dart';
import 'src/features/auth/register_screen/register.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Register(),
      routes: {
        '/onboarding': (context) => const OnBoarding(),
        '/session_2/': (context) => const Register(),
      },
    );
  }
}