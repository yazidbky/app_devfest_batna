import 'package:app_devfest_batna/api/login%20api/login_api_service.dart';
import 'package:app_devfest_batna/api/registre%20api/registre_api_service.dart';
import 'package:app_devfest_batna/cubit/login%20cubit/login_cubit.dart';
import 'package:app_devfest_batna/cubit/registre%20cubit/registre_cubit.dart';
import 'package:app_devfest_batna/cubit/uplaod%20csv%20cubit/uplaod_csv_cubit.dart';
import 'package:app_devfest_batna/registre%20and%20login/login.dart';
import 'package:app_devfest_batna/startUp%20ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Importing Bloc package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FileUploadCubit(), // Creating and providing the cubit
        ),
        BlocProvider(
          create: (_) => RegistrationCubit(
              AuthService()), // Creating and providing the cubit
        ),
        BlocProvider(
          create: (_) =>
              LoginCubit(LoginApiService()), // Creating and providing the cubit
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(), // Your initial screen
      ),
    );
  }
}
