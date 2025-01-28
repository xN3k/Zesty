import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.press,
    required this.icon,
  });
  final VoidCallback press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        fixedSize: Size(50, 50),
        backgroundColor: Color(0xFF979797).withValues(alpha: 0.1),
      ),
      color: Color(0xFF757575),
      onPressed: press,
      icon: Icon(icon),
    );
  }
}
