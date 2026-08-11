import 'package:flutter/material.dart';

import '../models/rating_dialog_config.dart';
import 'rating_star.dart';

/// Internal dialog widget used by [AppRatingDialog].
class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key, required this.config, this.onRated});

  final RatingDialogConfig config;
  final ValueChanged<int>? onRated;

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _rating = 0;

  String get _ratingLabel {
    if (_rating == 0) {
      return 'Tap a star to rate';
    }

    switch (_rating) {
      case 1:
        return 'Poor';
      case 2:
        return 'Fair';
      case 3:
        return 'Good';
      case 4:
        return 'Very Good';
      case 5:
        return 'Excellent';
      default:
        return '$_rating / ${widget.config.maxRating}';
    }
  }

  void _selectRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _submitRating() {
    if (_rating == 0) {
      return;
    }

    widget.onRated?.call(_rating);
    Navigator.of(context).pop(_rating);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      title: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: widget.config.activeColor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.star_rounded,
              size: 32,
              color: widget.config.activeColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.config.title,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.config.message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 20),
          _buildStars(),
          if (widget.config.showRatingLabel) ...[
            const SizedBox(height: 8),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                _ratingLabel,
                key: ValueKey<String>(_ratingLabel),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: _rating == 0
                      ? theme.textTheme.bodyMedium?.color?.withValues(
                          alpha: 0.55,
                        )
                      : widget.config.activeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(widget.config.cancelText),
        ),
        const SizedBox(width: 4),
        FilledButton(
          onPressed: _rating == 0 ? null : _submitRating,
          style: FilledButton.styleFrom(
            backgroundColor: widget.config.activeColor,
            foregroundColor: colorScheme.onPrimary,
          ),
          child: Text(widget.config.submitText),
        ),
      ],
    );
  }

  Widget _buildStars() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 2,
      children: List.generate(widget.config.maxRating, (index) {
        final starIndex = index + 1;

        return RatingStar(
          index: starIndex,
          rating: _rating,
          maxRating: widget.config.maxRating,
          activeColor: widget.config.activeColor,
          inactiveColor: widget.config.inactiveColor,
          size: widget.config.starSize,
          onTap: () => _selectRating(starIndex),
        );
      }),
    );
  }
}
