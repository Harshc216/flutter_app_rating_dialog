import 'package:flutter/material.dart';

/// A reusable widget that displays a row of 5 star icons representing a rating.
class RatingStarsRow extends StatelessWidget {
  const RatingStarsRow({
    super.key,
    required this.rating,
    this.starSize = 34.0,
    this.activeColor = Colors.amber,
    this.inactiveColor,
  });

  /// The active rating score (1-5).
  final int rating;

  /// Icon size for each star.
  final double starSize;

  /// Active color for filled stars.
  final Color activeColor;

  /// Inactive color for outlined stars.
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    final effectiveInactiveColor = inactiveColor ?? Colors.grey.shade400;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) {
          final isSelected = index < rating;

          return Icon(
            isSelected ? Icons.star_rounded : Icons.star_outline_rounded,
            size: starSize,
            color: isSelected ? activeColor : effectiveInactiveColor,
          );
        },
      ),
    );
  }
}
