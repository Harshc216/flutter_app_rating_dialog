import 'package:flutter/material.dart';

/// Interactive action button widget to trigger the rating dialog.
class RateAppButton extends StatelessWidget {
  const RateAppButton({
    super.key,
    required this.onPressed,
    this.label = 'Rate Our App',
  });

  /// Callback executed when pressed.
  final VoidCallback onPressed;

  /// Button text label.
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.star_rounded),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
