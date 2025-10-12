import 'dart:io';

void main() {
  print(" Welcome to Dart Interactive Calculator ");

  while (true) {
    stdout.write("Enter first number (or 'q' to quit): ");
    String? input1 = stdin.readLineSync();

    if (input1 == 'q') {
      print("Goodbye!");
      break;
    }

    stdout.write("Enter operator (+, -, *, /): ");
    String? operator = stdin.readLineSync();

    stdout.write("Enter second number: ");
    String? input2 = stdin.readLineSync();

    try {
      int num1 = double.parse(input1!).toInt();
      int num2 = double.parse(input2!).toInt();

      int result;

      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            print("Error: Division by zero is not allowed!\n");
            continue;
          }

          result = (num1 / num2).toInt();
          break;
        default:
          print("Invalid operator!\n");
          continue;
      }

      print("Result: $num1 $operator $num2 = $result\n");
    } catch (e) {
      print("Invalid input! Please enter valid numbers.\n");
    }
  }
}
