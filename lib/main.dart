import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_demo/modules/auth/Screens/login_screen.dart';
import 'package:map_demo/modules/auth/Screens/signup_screen.dart';
import 'package:map_demo/modules/auth/bloc/auth_bloc.dart';
import 'package:map_demo/modules/home/bloc/company_info_bloc.dart';
import 'package:map_demo/modules/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CompanyInfoBloc>(
          create: (BuildContext context) => CompanyInfoBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignUpScreen(),
        routes: {
          "/homeScreen": (context) => const HomeScreen(),
          "/loginScreen": (context) => const LoginScreen(),
        },
      ),
    );
  }
}
