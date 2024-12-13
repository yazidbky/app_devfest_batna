import 'package:app_devfest_batna/components/custom_button.dart';
import 'package:app_devfest_batna/components/login%20and%20registre%20components/passWord_textfield.dart';
import 'package:app_devfest_batna/components/login%20and%20registre%20components/text_field.dart';
import 'package:app_devfest_batna/components/logo.dart';
import 'package:app_devfest_batna/components/main_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController fullNamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmPasswordcontroller =
      TextEditingController();

  bool isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(logoPath),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Secure Your Business\nDashboard Access',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  'Provide your business details to get started and access powerful tools for growth',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300, fontSize: 15),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        CustomTextField(
                            controller: emailcontroller,
                            text: 'Email ',
                            hintText: 'Enter Your Email'),
                        CustomTextFieldPassword(
                            passwordController: passwordcontroller,
                            text: 'PassWord',
                            hintText: 'Enter Your PassWord',
                            obscureText: true),
                        CustomButton(
                          text: 'Next',
                          borderColor: mainColor,
                          onPressed: () {},
                          color: mainColor, // Button color remains unchanged
                          textColor: Colors.white,
                          size: 0.4,
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Sign Up'),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
