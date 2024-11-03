import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  const BasicAppButton({
    required this.text,
    required this.onPressed,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 65),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
