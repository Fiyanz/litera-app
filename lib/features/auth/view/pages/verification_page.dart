// lib/features/auth/view/pages/verification_page.dart

import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path
import 'package:litera_app/features/auth/view/pages/reset_password_page.dart'; // Navigasi ke halaman selanjutnya
import 'package:litera_app/features/auth/view/widgets/auth_button.dart'; // Sesuaikan path
import 'package:litera_app/features/auth/viewmodel/auth_viewmodel.dart'; // Sesuaikan path
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    final email = authViewModel.emailForgotPasswordController.text;

    // Default theme untuk pinput
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: Pallete.primaryLightColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Pallete.borderColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Pallete.textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Kode Verifikasi',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Pallete.textGrayColor, height: 1.5),
                  children: [
                    const TextSpan(text: 'Kami telah mengirimkan kode OTP ke '),
                    TextSpan(
                      text: email,
                      style: const TextStyle(
                        color: Pallete.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' untuk proses verifikasi'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Pinput(
                length: 4, // Jumlah kotak OTP
                controller: authViewModel.otpController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Pallete.primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AuthButton(
                buttonText: "Lanjut",
                onPressed: () {
                  // authViewModel.verifyOtp();
                  // Setelah verifikasi, navigasi ke halaman reset password
                  context.read<AuthViewModel>().verifyOtp();

                  // 2. Navigasi ke halaman untuk memasukkan password baru
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordPage(),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}