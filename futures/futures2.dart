void main() {
  example1();
}

//Future constructors
void example1() {
  final Future<String> theFuture = Future(() {
    return "I'm the Future!";
  });

  //Prints that the Future is instance of type String
  print(theFuture);

  Future<void> future2 = theFuture.then((value) => print(value));
  //Internal print() returns void.
  print(future2);
}

//Future constructor of type <int>
void example2() {
  final theFuture = Future(() {
    return 1;
  });

  print(theFuture);
}

//Using Future.value()-namedConstructor
void example3() {
  final theFuture = Future.value(3);
  print(
    theFuture.then(
      (value) => print(value),
    ),
  );
}

//Delaying returning value
void example4() {
  final theFuture =
      //Creating Future
      Future.delayed(
    Duration(seconds: 6),
    () => 3,
  )
          //Using Future
          .then(
    (value) => print(value),
  );

  print("End of main()");
}

//error handling
void example5() {
  final theFuture = Future.value(3)
      .then((value) => throw Error())
      .catchError((error) => print(error));
}

//Using whenComplete()
void example6() {
  final theFuture = Future.value(3)
      .then((value) => throw Error())
      .catchError((error) => print(error))
      .whenComplete(() => print("Future is finished."));
}

//await/async for Future
//try/catch/finally for handling errors in code
