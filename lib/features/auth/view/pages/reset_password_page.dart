// lib/features/auth/view/pages/reset_password_page.dart

import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart'; // Sesuaikan path
import 'package:litera_app/features/auth/view/pages/signin_page.dart'; // Navigasi kembali ke sign in
import 'package:litera_app/features/auth/view/widgets/auth_button.dart'; // Sesuaikan path
import 'package:litera_app/features/auth/view/widgets/custom_field.dart'; // Sesuaikan path
import 'package:litera_app/features/auth/view/widgets/success_dialog.dart';
import 'package:litera_app/features/auth/viewmodel/auth_viewmodel.dart'; // Sesuaikan path
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Atur ulang kata sandi',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Masukan kata sandi baru',
                  style: TextStyle(fontSize: 16, color: Pallete.textGrayColor),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Kata sandi baru',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              CustomField(
                hitText: "Masukan kata sandi baru",
                controller: authViewModel.newPasswordController,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              const Text(
                'Konfirmasi kata sandi', // Typo diperbaiki
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              CustomField(
                hitText: "Konfirmasi kata sandi baru",
                controller: authViewModel.confirmPasswordController,
                isPassword: true,
              ),
              const SizedBox(height: 40),
              AuthButton(
                buttonText: "Lanjut",
                onPressed: () {
                  context.read<AuthViewModel>().resetPassword();
                  showDialog(
                    context: context,
                    barrierDismissible: false, // Pengguna harus menekan tombol
                    builder: (BuildContext dialogContext) {
                      return SuccessDialog(
                        message: 'Password anda berhasil diperbarui!',
                        onOkPressed: () {
                          // 3. Setelah menekan "Oke", tutup dialog dan navigasi ke halaman login
                          Navigator.of(dialogContext).pop(); // Tutup dialog
                          
                          // Navigasi ke SignInPage dan hapus semua halaman sebelumnya
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInPage()),
                            (route) => false,
                          );
                        },
                      );
                    },
                  );
                  // Setelah berhasil, kembali ke halaman login
                  // Di aplikasi nyata, mungkin tampilkan dialog sukses dulu
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const SignInPage()),
                  //   (route) => false, // Hapus semua rute sebelumnya
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}