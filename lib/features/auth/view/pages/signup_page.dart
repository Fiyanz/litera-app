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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  fontSize: 20,
                  color: Pallete.textColor, // Use your theme's text color
                )
              ),
            ),
            CustomField(
              hitText: 'Masukan Username',
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 20,
                  color: Pallete.textColor, // Use your theme's text color
                )
              ),
            ),
            CustomField(
              hitText: 'Masukan Email Anda',
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 20,
                  color: Pallete.textColor, // Use your theme's text color
                )
              ),
            ),
            CustomField(
              hitText: 'Masukan Password Anda',
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 20,
                  color: Pallete.textColor, // Use your theme's text color
                )
              ),
            ),
            CustomField(
              hitText: 'Masukan Ulang Password Anda',
            ),

            const SizedBox(height: 20),
            AuthButton(),

            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sudah punya akun? ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Pallete.textColor, // Use your theme's text color
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Sign Up page
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Pallete.primaryColor, // Use your theme's primary color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}