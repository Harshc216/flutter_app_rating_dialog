import 'package:flutter/material.dart';
import 'package:flutter_app_rating/src/app_rating_dialog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppRatingDialog', () {
    testWidgets('shows rating dialog', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    AppRatingDialog.show(
                      context,
                      title: 'Rate Our App',
                      message: 'How was your experience?',
                    );
                  },
                  child: const Text('Open'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Rate Our App'), findsOneWidget);
      expect(
        find.text('How was your experience?'),
        findsOneWidget,
      );
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('submit button is disabled initially', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    AppRatingDialog.show(context);
                  },
                  child: const Text('Open'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final submitButton = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Submit'),
      );

      expect(submitButton.onPressed, isNull);
    });

    testWidgets('selecting a star enables submit', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    AppRatingDialog.show(context);
                  },
                  child: const Text('Open'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final stars = find.byIcon(Icons.star_outline_rounded);

      expect(stars, findsNWidgets(5));

      await tester.tap(stars.at(2));
      await tester.pumpAndSettle();

      final submitButton = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Submit'),
      );

      expect(submitButton.onPressed, isNotNull);
    });

    testWidgets('returns selected rating', (tester) async {
      int? selectedRating;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () async {
                    selectedRating = await AppRatingDialog.show(
                      context,
                    );
                  },
                  child: const Text('Open'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final stars = find.byIcon(Icons.star_outline_rounded);

      await tester.tap(stars.at(3));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Submit'));
      await tester.pumpAndSettle();

      expect(selectedRating, 4);
    });

    testWidgets('calls onRated callback', (tester) async {
      int? receivedRating;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    AppRatingDialog.show(
                      context,
                      onRated: (rating) {
                        receivedRating = rating;
                      },
                    );
                  },
                  child: const Text('Open'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final stars = find.byIcon(Icons.star_outline_rounded);

      await tester.tap(stars.at(4));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Submit'));
      await tester.pumpAndSettle();

      expect(receivedRating, 5);
    });
  });
}
