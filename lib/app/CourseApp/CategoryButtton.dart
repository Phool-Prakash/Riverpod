import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  const CategoryButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 6,
        foregroundColor: Colors.black, backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
      child: Text(label),
    );
  }
}
