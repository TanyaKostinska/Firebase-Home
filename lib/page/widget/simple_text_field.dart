import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final Icon? icon;
  final bool obscured;

  const SimpleTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.icon,
    this.obscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscured,
      decoration: InputDecoration(
        prefixIcon: icon ?? const SizedBox.shrink(),
        label: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 13,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Rubik',
        ),
        fillColor: Colors.blueGrey.withOpacity(0.2),
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }
}
