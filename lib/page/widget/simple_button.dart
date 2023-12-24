import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final Function()? onPressed;

  const SimpleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: const Text(
        'sign In',
        style: TextStyle(
          fontFamily: "Rubik",
          color: Colors.white54,
        ),
      ),
    );
  }
}
