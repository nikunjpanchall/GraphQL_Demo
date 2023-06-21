import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_demo/Widgets/custom_textfield.dart';
import 'package:map_demo/modules/auth/bloc/auth_bloc.dart';
import 'package:map_demo/theme/custom_text_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[400]!,
              Colors.blue[800]!,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is SignUpState && state.isLoaded) {
                  Navigator.pushNamed(context, "/homeScreen");
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'SIGNUP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 5,
                      ),
                    ),
                    const SizedBox(height: 36),
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Name',
                      icon: Icons.text_fields,
                      obscureText: false,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email",
                      icon: Icons.email,
                      obscureText: false,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "Password",
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/loginScreen");
                      },
                      child: Text(
                        "Already have an Account",
                        style: CustomTextStyle.bodyTextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignUpEvent(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                      ),
                      child: state is LoginState && state.isLoading
                          ? const CircularProgressIndicator()
                          : const Text('SIGNUP'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
