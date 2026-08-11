import 'package:flutter/material.dart';

/// Header widget with star badge, title, and descriptive subtitle.
class RatingHeaderWidget extends StatelessWidget {
  const RatingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 88,
          width: 88,
          decoration: BoxDecoration(
            color: Colors.amber.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.star_rounded,
            size: 52,
            color: Colors.amber,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'We Value Your Feedback',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Your feedback helps us improve the app '
          'and provide a better experience.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
