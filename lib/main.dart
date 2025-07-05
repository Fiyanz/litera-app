import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:litera_app/core/theme/theme.dart';
import 'package:litera_app/features/auth/view/pages/first_page.dart';
import 'package:litera_app/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:litera_app/features/booking/viewmodels/booking_viewmodel.dart';
import 'package:litera_app/features/bookmark/viewmodel/bookmark_viewmodel.dart';
import 'package:litera_app/features/history/viewmodels/history_viewmodel.dart';
import 'package:litera_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(), // Pastikan Anda memiliki HomeViewModel
        ),
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookmarkViewModel(),
          ),
        ChangeNotifierProvider(
          create: (context) => HistoryViewModel(),
          ),
        ChangeNotifierProvider(
          create: (context) => BookingViewModel(),
          ),
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
