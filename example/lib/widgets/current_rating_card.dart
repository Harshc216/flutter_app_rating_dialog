import 'package:flutter/material.dart';
import '../utils/rating_utils.dart';
import 'rating_stars_row.dart';

/// Card widget that shows the user's currently selected rating score and label.
class CurrentRatingCard extends StatelessWidget {
  const CurrentRatingCard({
    super.key,
    required this.selectedRating,
  });

  /// The currently selected rating value (null if not submitted).
  final int? selectedRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Your Current Rating',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          if (selectedRating == null)
            Text(
              'No rating submitted yet',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            )
          else ...[
            RatingStarsRow(rating: selectedRating!),
            const SizedBox(height: 12),
            Text(
              '$selectedRating / 5',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              ratingText(selectedRating!),
              style: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
