import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/calculator.dart';
import 'package:test_app/main.dart';
import 'package:mockito/annotations.dart';
import 'package:test_app/network_test.dart';

import 'calculator_test.mocks.dart';

class MockCalc extends Mock implements Calculator {}


// Generate the mock class
@GenerateMocks([NetworkService])
void main() {
  /// Setup the class and create an instance of [Calculator] class.
  late Calculator calc;

  late MockNetworkService mockService;

  setUp(() {
    calc = MockCalc();

    mockService = MockNetworkService();

    log('Run [before] every test is executed');
  });

  setUpAll(() => log('Run [before] any test is executed'));

  tearDown(() => log('Run [after] every test is executed'));

  tearDownAll(() => log('Run [after] all tests have been executed'));

  /// The group function allows you to logically organize related test cases together.
  /// This makes your test code cleaner, easier to understand, and more maintainable
  ///

  test('should return stubbed data', () async {
    when(mockService.fetchData()).thenAnswer((_) async => 'Stubbed Data');

    final result = await mockService.fetchData();

    verify(result).called(1);

    /// Verify that the method returns the stubbed value
    expect(result, 'Stubbed Data');
  });

  group('Adding operations in one group', () {
    test('the calculator return 4 when adding 2 and 2', () async {
      /// validation for the instance is not null
      expect(calc, isNotNull);

      when(calc.add(2, 2)).thenReturn(4);

      /// Assign and collect result to start a test.
      final result = calc.add(2, 2);

      /// validation for the result is shouldn't be zero
      expect(result, isNonZero);

      /// validation for the result is double
      expect(result, isA<double>(),
          reason: 'The adding operation should be a double value');

      /// expectation, compare the result against an expected value.
      expect(result, 4, reason: 'It should be exactly (4)');
    });

    test('the calculator return 20 when adding 15 and 5', () {
      /// validation for the instance is not null
      expect(calc, isNotNull);

      /// Assign and collect result to start a test.
      final result = calc.add(15, 5);

      /// validation for the result is double
      expect(result, isA<double>(),
          reason: 'The adding operation should be a double value');

      /// expectation, compare the result against an expected value.
      expect(result, 20, reason: 'It should be exactly (20)');
    });
  });

  group('subtract operations in one group', () {
    test('the calculator return 4 when subtracting 6 to 2', () {
      /// validation for the instance is not null
      expect(calc, isNotNull);

      /// Assign and collect result to start a test.
      final result = calc.subtract(6, 2);

      /// validation for the result is double
      expect(result, isA<double>(),
          reason: 'The adding operation should be a double value');

      /// expectation, compare the result against an expected value.
      expect(result, 4, reason: 'It should be exactly (4)');
    });

    test('the calculator return -4 when subtracting 10 to 14', () {
      /// validation for the instance is not null
      expect(calc, isNotNull);

      /// Assign and collect result to start a test.
      final result = calc.subtract(10, 14);

      /// validation the result should be a negative number
      expect(result, isNegative);

      /// validation for the result is double
      expect(result, isA<double>(),
          reason: 'The adding operation should be a double value');

      /// expectation, compare the result against an expected value.
      expect(result, -4, reason: 'It should be exactly (-4)');
    });
  });

  group('multiply operations in one group', () {
    test('the calculator return 100 when multiplying 20 by 5', () {
      /// validation for the instance is not null
      expect(calc, isNotNull);

      /// Assign and collect result to start a test.
      final result = calc.multiply(20, 5);

      /// validation for the result is double
      expect(result, isA<double>(),
          reason: 'The adding operation should be a double value');

      /// expectation, compare the result against an expected value.
      expect(result, 100, reason: 'It should be exactly (100)');
    });

    test('the calculator return 0 when multiplying 1000 by 0', () {
      /// validation for the instance is not null
      expect(calc, isNotNull);

      /// Assign and collect result to start a test.
      final result = calc.multiply(1000, 0);

      /// validation for the result is should be zero
      expect(result, isZero);

      /// validation for the result is double
      expect(result, isA<double>(),
          reason: 'The adding operation should be a double value');

      /// expectation, compare the result against an expected value.
      expect(result, 0, reason: 'It should be exactly (0)');
    });
  });

  group('divide operations in one group', () {
    test('the calculator return 0.05 when dividing 5 by 100', () {
      /// validation for the instance is not null
      expect(calc, isNotNull);

      /// Assign and collect result to start a test.
      final result = calc.divide(5, 100);

      /// validation for the result is double
      expect(result, isA<double>(),
          reason: 'The adding operation should be a double value');

      /// expectation, compare the result against an expected value.
      expect(result, 0.05, reason: 'It should be exactly (0.05)');
    });

    test('the calculator return [ARGUMENT ERROR] when dividing by 0', () {
      /// validation for the instance is not null
      expect(calc, isNotNull);

      /// Assign and collect result to start a test.
      /// used A function result to passed a test function

      result() => calc.divide(20, 0);

      /// validation should be a wrong number
      expect(result, throwsArgumentError);
    });
  });

  /// Testing a [Future] keyword
  group('future with power of two', () {
    test('return a 16 when entered value is 4', () async {
      final result = await calc.powerOfTwo(4);

      expect(result, 16);
    });
  });

  /// This is a tests for widget test
  group('This group for widget test', () {
    testWidgets(
        'renders three custom widget in the screen of type [CustomWidgetForTesting]',
        (tester) async {
      await tester.pumpWidget(const MyApp());
      final result = find.byType(CustomWidgetForTesting);

      expect(result, findsNWidgets(3));
    });

    testWidgets('show result of text field when given two numbers',
        (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.enterText(find.byKey(const Key('myTextFieldKey1')), '10');
      await tester.enterText(find.byKey(const Key('myTextFieldKey2')), '10');

      await tester.pumpAndSettle();

      expect(find.text('20.0'), findsOneWidget);
    });

    testWidgets('no buttons in the screen', (tester) async {
      await tester.pumpWidget(const MyApp());

      final expected = find.byType(ElevatedButton);

      expect(expected, findsNothing);
    });
  });
}
