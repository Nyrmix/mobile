import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  bool isChecked = false;
  bool obscurePassword = true;

  final _formKey = GlobalKey<FormState>();


  final _fullName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _emailAddress = TextEditingController();
  final _userPassword = TextEditingController();


  @override
  void dispose() {
    _fullName.dispose();
    _phoneNumber.dispose();
    _emailAddress.dispose();
    _userPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizedBox( height: 100);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 36, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an account',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Complete the sign up process to get started',
                    style: GoogleFonts.roboto(
                        color: grayColorDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 138),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(25),
                children: [
                  TextFormField(
                    controller: _fullName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        hintText: 'What is your full name?',
                        labelText: 'Full Name'
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50)
                    ],
                    validator: fullNameValidate,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _phoneNumber,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      hintText: '7 (955) 281 35 56',
                      labelText: 'Phone number',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11)
                    ],
                    validator: phoneNumberValidate,

                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        hintText: 'example@test.com',
                        labelText: 'Email Address'
                    ),
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                    ],
                    validator: emailValidator,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _userPassword,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        hintText: '*******',
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        )
                    ),
                    maxLength: 8,
                    validator: userPasswordValidate,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  'By ticking this box, you agree to our ',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    color: grayColorDark,
                                  ),
                                ),
                                Text(
                                  'Terms and conditions and private policy',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    color: warningColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(342, 46),
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700, color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.roboto(color: grayColorDark),
                      ),
                      Text(
                        'Sign in',
                        style: GoogleFonts.roboto(
                            color: primaryColor, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'or sign in using',
                        style: GoogleFonts.roboto(
                          color: grayColorDark,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        '../assets/icons/google.png',
                        height: 16,
                        width: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Name: ${_fullName.text}');
      print('Phone: ${_phoneNumber.text}');
      print('Email: ${_emailAddress.text}');
      print('Email: ${_userPassword.text}');

    }
  }

  String? fullNameValidate(value) {
    final _fullNameExp = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)?$');
    if (value.isEmpty) {
      return 'Name is required';
    } else if(!_fullNameExp.hasMatch(value)) {
      return 'Please enter full name';
    } else {
      return null;
    }
  }
  String? phoneNumberValidate(value) {
    if (value.isEmpty){
      return 'Phone is required';
    }
    else{
      return null;}
  }
  String? emailValidator(value){
    if (value.isEmpty){
      return 'Email is required';
    }
    else{
      return null;}
  }  String? userPasswordValidate(value){
    if (value.isEmpty){
      return 'Password is required';
    }
    else{
      return null;}
  }
}