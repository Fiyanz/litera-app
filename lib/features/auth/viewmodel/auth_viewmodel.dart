// lib/features/auth/viewmodel/auth_viewmodel.dart

import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  // Controller yang sudah ada
  final TextEditingController emailSignInController = TextEditingController();
  final TextEditingController passwordSignInController = TextEditingController();
  final TextEditingController emailForgotPasswordController = TextEditingController();

  //== Controller BARU untuk alur reset password ==//
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //== Method BARU ==//

  // Method untuk handle lupa kata sandi
  // (logika akan ditambahkan di sini)
  void submitEmailForPasswordReset() {
    // Di dunia nyata, di sini Anda akan memanggil API untuk mengirim OTP.
    // Untuk saat ini, kita hanya print email sebagai simulasi.
    print('Meminta OTP untuk email: ${emailForgotPasswordController.text}');
  }

  // Method untuk verifikasi OTP
  void verifyOtp() {
    // Di dunia nyata, di sini Anda akan verifikasi OTP ke server.
    print('Memverifikasi OTP: ${otpController.text}');
  }

  // Method untuk mengatur ulang kata sandi
  void resetPassword() {
    // Lakukan validasi sederhana
    if (newPasswordController.text != confirmPasswordController.text) {
      print('Password tidak cocok!');
      // Di aplikasi nyata, tampilkan snackbar atau error message
      return;
    }
    if (newPasswordController.text.isEmpty) {
      print('Password tidak boleh kosong!');
      return;
    }

    print('Password berhasil diatur ulang ke: ${newPasswordController.text}');
    // Di sini Anda akan panggil API untuk menyimpan password baru.
  }


  // Penting untuk membersihkan semua controller
  @override
  void dispose() {
    emailSignInController.dispose();
    passwordSignInController.dispose();
    emailForgotPasswordController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}