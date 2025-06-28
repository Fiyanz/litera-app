import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/auth/view/pages/forgot_password_page.dart';
import 'package:litera_app/features/auth/view/pages/signup_page.dart';
import 'package:litera_app/features/auth/view/widgets/auth_button.dart';
import 'package:litera_app/features/auth/view/widgets/custom_field.dart';
import 'package:litera_app/features/home/view/pages/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    // Dispose of the controllers to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Login Akun',
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
                controller: passwordController,
                isPassword: true, // Use the controller for password
              ),
              const SizedBox(height: 20),
              AuthButton(
                buttonText: 'Login',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false, // Hapus semua rute sebelumnya
                  );
                },
              ),
          
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage()
                    ),
                    
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Lupa Kata Sandi? ',
                    style: Theme.of(context).textTheme.titleMedium, 
                    children: [
                      TextSpan(
                        text: 'Atur Ulang Kata Sandi',
                        style: const TextStyle(
                          color: Pallete.primaryColor, // Use your theme's primary color
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}