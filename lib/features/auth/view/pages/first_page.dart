import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Pallete.primaryColor,
              Pallete.primaryLightColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Litera
            ClipPath(
              clipper: BookClipper(),
              child: Container(
                color: Colors.white,
                width: 120,
                height: 120,
              ),
            ),
            SizedBox(height: 16),

            // Judul Aplikasi
            Text(
              'Litera',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),

            // Tagline
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Litera memudahkan kamu meminjam dan meminjamkan buku ke pengguna lain di sekitarmu.',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  height: 1.5,
                ),
                  textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32),

            // Tombol Daftar
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.primaryColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Daftar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Or Separator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Atau',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Tombol Masuk
            TextButton(
              onPressed: () {},
              child: Text(
                'Sudah punya akun? Log In',
                style: TextStyle(
                  color: Color(0xFF4CAF50),
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Custom Clipper untuk Logo Buku
class BookClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path();
    path.moveTo(w * 0.5, 0);
    path.cubicTo(w * 0.5, h * 0.3, w * 0.2, h * 0.7, 0, h);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.cubicTo(w * 0.8, h * 0.7, w * 0.5, h * 0.3, w * 0.5, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}