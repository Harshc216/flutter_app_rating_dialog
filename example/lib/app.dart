import 'package:flutter/material.dart';
import 'views/rating_home_screen.dart';

/// Root application widget configuring MaterialApp theme and initial screen.
class RatingDialogExampleApp extends StatelessWidget {
  const RatingDialogExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Rating Dialog',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.amber,
      ),
      home: const RatingHomeScreen(),
    );
  }
}
