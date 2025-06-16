import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hitText;
  const CustomField({super.key, required this.hitText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hitText
      ),
    );
  }
}