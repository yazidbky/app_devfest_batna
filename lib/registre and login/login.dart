import 'package:app_devfest_batna/api/login%20api/login_api_service.dart';
import 'package:app_devfest_batna/components/custom_button.dart';
import 'package:app_devfest_batna/components/login%20and%20registre%20components/passWord_textfield.dart';
import 'package:app_devfest_batna/components/login%20and%20registre%20components/text_field.dart';
import 'package:app_devfest_batna/cubit/login%20cubit/login_cubit.dart';
import 'package:app_devfest_batna/cubit/login%20cubit/login_state.dart';
import 'package:app_devfest_batna/registre%20and%20login/registre.dart';
import 'package:app_devfest_batna/user%20landing%20page/landin_page_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();

    return BlocProvider(
      create: (_) => LoginCubit(LoginApiService()),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('images/logo.png'),
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
                            hintText: 'Enter Your Email',
                          ),
                          CustomTextFieldPassword(
                            passwordController: passwordcontroller,
                            text: 'Password',
                            hintText: 'Enter Your Password',
                            obscureText: true,
                          ),
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccess) {
                                // Navigate to the next screen
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LandinPageUser(),
                                    ));
                              } else if (state is LoginFailure) {
                                // Show the error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.error)),
                                );
                              }
                            },
                            builder: (context, state) {
                              return CustomButton(
                                text: state is LoginLoading
                                    ? 'Loading...'
                                    : 'Next',
                                borderColor: Colors.blue,
                                onPressed: state is LoginLoading
                                    ? () {}
                                    : () {
                                        context.read<LoginCubit>().loginUser(
                                              emailcontroller.text,
                                              passwordcontroller.text,
                                            );
                                        print("Email: ${emailcontroller.text}");
                                        print(
                                            "Password: ${passwordcontroller.text}");
                                      },
                                color: Colors.blue,
                                textColor: Colors.white,
                                size: 0.4,
                              );
                            },
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Registre(),
                                        ));
                                  },
                                  child: const Text('Sign Up'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
