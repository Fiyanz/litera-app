import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/auth/view/widgets/custom_field.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            'Daftar Akun',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Pallete.textColor, // Use your theme's text color
            ),
          ),
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

        ],
      ),
    );
  }
}