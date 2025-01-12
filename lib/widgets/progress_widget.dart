import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final double count;
  final Color color;
  final String title;
  final String subtitle;
  final double value;

  const ProgressWidget({
    super.key,
    required this.count,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      width: 160,
      height: 210,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 85,
            child: CircleProgressBar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white24,
              value: value,
              child: Center(
                child: AnimatedCount(
                  count: count,
                  unit: '%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white38,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
