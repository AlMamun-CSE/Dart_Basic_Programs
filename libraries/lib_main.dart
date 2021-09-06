import 'lib1.dart';

void main() {
  int num1 = 5;
  int num2 = 2;

  int sum = addition(num1, num2);
  print("Sum of $num1 and $num2 is $sum");

  //Compile-time error because _add() function is private
  //sum = _add(num1, num2);
}
