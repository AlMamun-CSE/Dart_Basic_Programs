void main() {
  var myNumber = 1;
  print("Type of myNumber: ${myNumber.runtimeType}");
  //Output:
  // Type of myNumber: int

  var myString = "This is String";
  print("Type of myString: ${myString.runtimeType}");
  //Output:
  // Type of myString: String

  var myDouble = 1.0;
  print("Type of myDouble: ${myDouble.runtimeType}");
  //Output:
  // Type of myDouble: double

  var myList = [1, 2, 3];
  print("Type of myList: ${myList.runtimeType}");
  //Output:
  // Type of myList: List<int>
}