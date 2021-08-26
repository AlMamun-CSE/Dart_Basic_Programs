//Al Mamun CSE.........................
void main() {
  // Conditional Expressions

  // 1.   condition ? exp1 : exp2   ......[This is ternary operator]
  // If condition is true, evaluates expr1 (and returns its value);
  // otherwise, evaluates and returns the value of expr2.

  int a = 2;
  int b = 3;

  int smallNumber = a < b ? a : b;
  print("$smallNumber is smaller");

  // 2.   exp1 ?? exp2
  // If expr1 is non-null, returns its value; otherwise, evaluates and
  // returns the value of expr2.

  String name2 = null;

  String nameToPrint = name2 ?? "Guest User";
  print(nameToPrint);
}
