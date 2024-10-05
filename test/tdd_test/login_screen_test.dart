import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/tdd_example/login_screen.dart';

void main() {
  testWidgets('Empty email and password shows error messages',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: LoginScreen()));

        await tester.tap(find.text('Login'));
        await tester.pump();

        expect(find.text('Email can\'t be empty'), findsOneWidget);
        expect(find.text('Password must be at least 8 characters'), findsOneWidget);
      });

  testWidgets('Valid email and password does not show error messages',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: LoginScreen()));

        await tester.enterText(find.byType(TextFormField).first, 'test@test.com');
        await tester.enterText(find.byType(TextFormField).last, '12345678');
        await tester.tap(find.text('Login'));
        await tester.pumpAndSettle();

        expect(find.text('Email can\'t be empty'), findsNothing);
        expect(find.text('Password must be at least 8 characters'), findsNothing);
      });
}
