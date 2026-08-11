import 'package:flutter/material.dart';

/// A single interactive star used by [RatingDialog].
class RatingStar extends StatelessWidget {
  const RatingStar({
    super.key,
    required this.index,
    required this.rating,
    required this.maxRating,
    required this.activeColor,
    required this.inactiveColor,
    required this.size,
    required this.onTap,
  });

  /// Position of this star, starting from 1.
  final int index;

  /// Currently selected rating.
  final int rating;

  /// Maximum available rating.
  final int maxRating;

  /// Color of selected stars.
  final Color activeColor;

  /// Color of unselected stars.
  final Color inactiveColor;

  /// Size of the star.
  final double size;

  /// Called when the star is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isActive = index <= rating;

    return Semantics(
      button: true,
      label: 'Rate $index out of $maxRating',
      selected: isActive,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Icon(
              isActive
                  ? Icons.star_rounded
                  : Icons.star_outline_rounded,
              key: ValueKey<bool>(isActive),
              size: size,
              color: isActive ? activeColor : inactiveColor,
            ),
          ),
        ),
      ),
    );
  }
}