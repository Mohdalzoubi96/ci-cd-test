import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/navigation_test/navigation_test_screens.dart';

void main() {
  testWidgets('Navigates to DetailsScreen when button is tapped',
      (WidgetTester tester) async {
    // Build the widget tree and pump the app
    await tester.pumpWidget(MaterialApp(routes: {
      '/details': (context) => const DetailsScreen(),
    }, home: const HomeScreen()));

    // Verify that HomeScreen is displayed
    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.text('Go to Details'), findsOneWidget);

    // Tap the button to navigate to DetailsScreen
    await tester.tap(find.text('Go to Details'));

    // Wait for the navigation animation to complete
    await tester.pumpAndSettle();

    // Verify that DetailsScreen is now displayed
    expect(find.text('Details Screen'), findsOneWidget);
    expect(find.text('Welcome to Details Screen'), findsOneWidget);
  });
}
