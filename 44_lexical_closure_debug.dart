Function makeAdder(int addBy) {
  var a = addBy;
  var aa = (int i) => a + i;
  return aa;
}
var a = 10;

void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2)(4); //first
  var add3 = makeAdder(3);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  print(add2 == 6);
  print(add3(5) ==8);
  print(add2 == 7);
  print(add4(3) == 7);
}
