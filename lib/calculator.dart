class Calculator {
  double add(double number1, double number2) => number1 + number2;

  double subtract(double number1, double number2) => number1 - number2;

  double multiply(double number1, double number2) => number1 * number2;

  double divide(double number1, double number2) {
    if (number2 == 0) throw ArgumentError('You can\'t divide by zero');
    return number1 / number2;
  }

  Future<double> powerOfTwo(double number) => Future.delayed(const Duration(milliseconds: 700), () => number * number);
}
