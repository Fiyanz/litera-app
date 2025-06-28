// lib/features/auth/view/pages/forgot_password_page.dart

import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/auth/view/pages/verification_page.dart';
import 'package:litera_app/features/auth/view/widgets/auth_button.dart';
import 'package:litera_app/features/auth/view/widgets/custom_field.dart';
import 'package:litera_app/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil ViewModel menggunakan context.read. Lebih ringkas.
    // Ini adalah singkatan dari Provider.of<AuthViewModel>(context, listen: false).
    final authViewModel = context.read<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Pallete.textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Atur ulang kata sandi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Pallete.textColor,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Masukan Email anda untuk membuat kata sandi baru',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Pallete.textGrayColor,
                ),
              ),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomField(
                hitText: 'Masukan email anda',
                controller: authViewModel.emailForgotPasswordController,
              ),
              const SizedBox(height: 30),
              AuthButton(
                buttonText: 'Lanjut',
                onPressed: () {
                  // authViewModel.submitEmailForPasswordReset();
                  context.read<AuthViewModel>().submitEmailForPasswordReset();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VerificationPage()),
                  );
                },
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    color: Pallete.textGrayColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}