import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/auth/view/pages/signin_page.dart';
import 'package:litera_app/features/auth/view/pages/signup_page.dart';
import 'package:litera_app/features/auth/view/widgets/auth_button.dart';
import 'package:litera_app/features/auth/view/widgets/custom_cllipper.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Biru dengan lengkungan bawah
          ClipPath(
            clipper: TopWaveClipper(),
            child: Container(
              height: 450, // atur tinggi sesuai desain
              color: Pallete.backgroundColor,
            ),
          ),
          // Konten utama
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/litera_logo.png', // ganti dengan logo kamu
                    height: 200,
                    // width: 120,
                  ),
                  SizedBox(height: 130),
                  Text(
                    'Litera memudahkan kamu meminjam dan meminjamkan buku ke pengguna lain di sekitarmu.',
                    style: TextStyle(
                      color: Pallete.textGrayColor, // Gunakan warna teks dari tema
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  AuthButton(
                    buttonText: 'Daftar',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Pallete.textGrayColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Or'),
                      ),
                      Expanded(child: Divider(color: Pallete.textGrayColor)),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sudah punya akun? Log In',
                      style: TextStyle(
                        color: Pallete.textColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
