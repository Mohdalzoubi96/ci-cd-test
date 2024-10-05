import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/tdd_example/login_validator.dart';

void main() {
  group('Login Validator', () {
    test('Empty email returns error string', () {
      final result = LoginValidator.validateEmail('');
      expect(result, 'Email can\'t be empty');
    });

    test('Invalid email returns error string', () {
      final result = LoginValidator.validateEmail('invalidemail');
      expect(result, 'Enter a valid email');
    });

    test('Valid email returns null', () {
      final result = LoginValidator.validateEmail('test@test.com');
      expect(result, null);
    });

    test('Password less than 8 characters returns error string', () {
      final result = LoginValidator.validatePassword('1234567');
      expect(result, 'Password must be at least 8 characters');
    });

    test('Valid password returns null', () {
      final result = LoginValidator.validatePassword('12345678');
      expect(result, null);
    });
  });
}
