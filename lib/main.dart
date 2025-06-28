import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/theme.dart';
import 'package:litera_app/features/auth/view/pages/first_page.dart';
import 'package:litera_app/features/auth/viewmodel/auth_viewmodel.dart';
// import 'package:litera_app/features/auth/view/pages/first_page.dart';
import 'package:litera_app/features/home/viewmodel/home_viewmodel.dart';
// import 'package:litera_app/features/home/view/pages/home_page.dart';
import 'package:provider/provider.dart';
// import 'package:litera_app/features/auth/view/pages/first_page.dart';
// import 'package:litera_app/features/auth/view/pages/signin_page.dart';
// import 'package:litera_app/features/auth/view/pages/signin_page.dart';
// import 'package:litera_app/features/auth/view/pages/signup_form.dart';
// import 'package:litera_app/features/auth/view/pages/signup_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(), // Pastikan Anda memiliki HomeViewModel
        ),
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        )
      ],
      child: MyApp(), // Ganti dengan SigninPage() atau SignUpForm() sesuai kebutuhan
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Litera',
      theme: AppTheme.lightThemeMode,
      home: const FirstPage(), // Change this to SigninPage() or SignUpForm() as needed
    );
  }
}
