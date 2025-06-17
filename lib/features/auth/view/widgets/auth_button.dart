import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50), 
        fixedSize: const Size(341, 54),// Full width button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Pallete.primaryColor, // Use theme's primary color
      ),
      onPressed: () {}, 
      child: Text('Masuk', 
        style: TextStyle(
          fontSize: 18,
          color: Pallete.primaryLightColor, // Use theme's text color
        ),
      ),
    );
  }
}