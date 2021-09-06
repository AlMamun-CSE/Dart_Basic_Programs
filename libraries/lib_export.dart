import 'math_export/lib/maths_export.dart';

void main() {
  int num1 = 5;
  int num2 = 2;

  int sum = addition(num1, num2);
  print("Sum of $num1 and $num2 is $sum");

  //Compile-time error because lib2.dart is not exported
  //print("is number even? ${isNumberEven(num2)}");
}
