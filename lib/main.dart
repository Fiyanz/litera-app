import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/theme.dart';
// import 'package:litera_app/features/auth/view/pages/signin_page.dart';
// import 'package:litera_app/features/auth/view/pages/signup_form.dart';
import 'package:litera_app/features/auth/view/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightThemeMode,
      home: const SignUpPage(), // Change this to SigninPage() or SignUpForm() as needed
    );
  }
}
