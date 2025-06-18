import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/auth/view/widgets/auth_button.dart';
import 'package:litera_app/features/auth/view/widgets/custom_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    // Dispose of the controllers to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Daftar Akun',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Pallete.textColor, // Use your theme's text color
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor, // Use your theme's text color
                  )
                ),
              ),
              CustomField(
                hitText: 'Masukan Username',
                controller: usernameController, // Use the controller for username
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor, // Use your theme's text color
                  )
                ),
              ),
              CustomField(
                hitText: 'Masukan Email Anda',
                controller: emailController, // Use the controller for email
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor, // Use your theme's text color
                  )
                ),
              ),
              CustomField(
                hitText: 'Masukan Password Anda',
                controller: passwordController, // Use the controller for password
                isPassword: true, // Use the controller for password
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor, // Use your theme's text color
                  )
                ),
              ),
              CustomField(
                hitText: 'Masukan Ulang Password Anda',
                controller: confirmPasswordController,
                isPassword: true, // Use the controller for confirm password
              ),
        
              const SizedBox(height: 20),
              AuthButton(),
        
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  text: 'Sudah punya akun? ',
                  style: Theme.of(context).textTheme.titleMedium, 
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        color: Pallete.primaryColor, // Use your theme's primary color
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}