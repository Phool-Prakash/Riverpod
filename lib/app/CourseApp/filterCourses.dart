import 'package:flutter/material.dart';

class FilterCourseButton extends StatelessWidget {
  final Color color;
  final String label;
  final IconData icon;

  FilterCourseButton({required this.color, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_forward, color: Colors.white),
                  Align(
                    alignment: Alignment.bottomRight,
                    child:  Icon(icon, color: Colors.white),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}