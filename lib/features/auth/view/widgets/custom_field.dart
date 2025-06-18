import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hitText;
  final TextEditingController controller;
  final bool isPassword;
  const CustomField({
      super.key, 
      required this.hitText, 
      required this.controller,
      this.isPassword = false
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hitText,
        ),
        obscureText: isPassword,
      ),
    );
  }
}