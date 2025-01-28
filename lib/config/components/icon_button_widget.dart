import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
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
            borderRadius: BorderRadius.circular(14),
          ),
          fixedSize: Size(50, 50),
          backgroundColor: Colors.grey.shade300),
      // color: Colors.white,
      onPressed: press,
      icon: Icon(icon),
    );
  }
}
