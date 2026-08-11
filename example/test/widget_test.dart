import 'package:exmple/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RatingDialogExampleApp builds cleanly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const RatingDialogExampleApp());

    expect(find.text('App Rating Dialog'), findsOneWidget);
    expect(find.text('We Value Your Feedback'), findsOneWidget);
    expect(find.text('Rate Our App'), findsOneWidget);
  });
}
