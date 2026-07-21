import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.hasIcon = false,
  });
  final String text;
  final VoidCallback onPressed;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6C63FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: hasIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward),
                ],
              )
            : Text(text),
      ),
    );
  }
}
