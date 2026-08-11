import 'package:flutter/material.dart';

import 'models/rating_dialog_config.dart';
import 'widgets/rating_dialog.dart';

/// A reusable rating dialog for Flutter applications.
class AppRatingDialog {
  AppRatingDialog._();

  /// Shows the rating dialog.
  ///
  /// Returns the selected rating when submitted,
  /// or null when the dialog is cancelled.
  static Future<int?> show(
    BuildContext context, {
    String title = 'Rate Our App',
    String message = 'Your feedback helps us improve.',
    ValueChanged<int>? onRated,
    Color activeColor = Colors.amber,
    Color inactiveColor = Colors.grey,
    int maxRating = 5,
    double starSize = 38,
    String cancelText = 'Cancel',
    String submitText = 'Submit',
    bool showRatingLabel = true,
    bool barrierDismissible = true,
  }) {
    final config = RatingDialogConfig(
      title: title,
      message: message,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      maxRating: maxRating,
      starSize: starSize,
      cancelText: cancelText,
      submitText: submitText,
      showRatingLabel: showRatingLabel,
      barrierDismissible: barrierDismissible,
    );

    return showDialog<int>(
      context: context,
      barrierDismissible: config.barrierDismissible,
      builder: (context) {
        return RatingDialog(config: config, onRated: onRated);
      },
    );
  }
}
