import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {},
      label: Row(
        spacing: 25,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 13),
              foregroundColor: Colors.white,
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          IconButton(
            style: IconButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(width: 2, color: Colors.grey.shade300),
              ),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
        ],
      ),
    );
  }
}
