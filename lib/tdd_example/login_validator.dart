class LoginValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email can\'t be empty';
    }
    String pattern =
        r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
}
