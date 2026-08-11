import 'package:flutter/material.dart';

/// Configuration for [AppRatingDialog].
class RatingDialogConfig {
  /// Creates a rating dialog configuration.
  const RatingDialogConfig({
    this.maxRating = 5,
    this.starSize = 38,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
    this.title = 'Rate Our App',
    this.message = 'Your feedback helps us improve.',
    this.cancelText = 'Cancel',
    this.submitText = 'Submit',
    this.showRatingLabel = true,
    this.barrierDismissible = true,
  }) : assert(maxRating > 0, 'maxRating must be greater than 0'),
       assert(starSize > 0, 'starSize must be greater than 0');

  /// Maximum number of stars.
  final int maxRating;

  /// Size of each rating star.
  final double starSize;

  /// Color of selected stars.
  final Color activeColor;

  /// Color of unselected stars.
  final Color inactiveColor;

  /// Dialog title.
  final String title;

  /// Dialog description/message.
  final String message;

  /// Cancel button text.
  final String cancelText;

  /// Submit button text.
  final String submitText;

  /// Whether the rating label should be displayed.
  final bool showRatingLabel;

  /// Whether the dialog can be dismissed by tapping outside.
  final bool barrierDismissible;
}
