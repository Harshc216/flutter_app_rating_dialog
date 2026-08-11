import 'package:flutter/material.dart';
import 'package:flutter_app_rating/flutter_app_rating.dart';

import '../widgets/current_rating_card.dart';
import '../widgets/rate_app_button.dart';
import '../widgets/rating_header_widget.dart';
import '../widgets/rating_info_card.dart';

/// Main screen layout and state manager for rating dialog demo.
class RatingHomeScreen extends StatefulWidget {
  const RatingHomeScreen({super.key});

  @override
  State<RatingHomeScreen> createState() => _RatingHomeScreenState();
}

class _RatingHomeScreenState extends State<RatingHomeScreen> {
  int? _selectedRating;

  Future<void> _openRatingDialog() async {
    final rating = await AppRatingDialog.show(
      context,
      title: 'Rate Our App',
      message: 'How was your experience with our application?',
      activeColor: Colors.amber,
      inactiveColor: Colors.grey.shade400,
      starSize: 40,
      cancelText: 'Not Now',
      submitText: 'Submit',
      showRatingLabel: true,
      barrierDismissible: true,
      onRated: (rating) {
        debugPrint('User selected rating: $rating');
      },
    );

    if (!mounted || rating == null) {
      return;
    }

    setState(() {
      _selectedRating = rating;
    });

    _showRatingSuccess(rating);
  }

  void _showRatingSuccess(int rating) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text('Thank you! You rated us $rating/5'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text(
          'App Rating Dialog',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const RatingHeaderWidget(),
              const SizedBox(height: 30),
              CurrentRatingCard(selectedRating: _selectedRating),
              const SizedBox(height: 24),
              RateAppButton(onPressed: _openRatingDialog),
              const SizedBox(height: 30),
              const RatingInfoCard(),
            ],
          ),
        ),
      ),
    );
  }
}
