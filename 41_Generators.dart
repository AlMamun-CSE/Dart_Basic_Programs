void main() {
  //Enable the main function that you're interested in exploring
  //main1();
  //main2();
  //main3();
  main4();
}

void main1() {
  print("Getting CountDown Iterable [sync* + yield]");
  Iterable<int> sequence = countDownFromSync(5);

  print("Starting...");

  for (int value in sequence) {
    print(value);
  }
  print("DONE");
}

//sync*
Iterable<int> countDownFromSync(int num) sync* {
  while (num > 0) {
    yield num--;
  }
}

void main2() {
  print("Getting CountDown Stream [async* + yield]");
  Stream<int> sequence = countDownFromAsync(5);

  print("Starting...");

  sequence.listen((int value) {
    print(value);
  });
  print("DONE");
}

//async*
Stream<int> countDownFromAsync(int num) async* {
  while (num > 0) {
    yield num--;
  }
}

void main3() {
  print("Getting CountDown Iterable [sync* + yield*]");
  Iterable<int> sequence = countDownFromSyncRecursive(5);

  print("Starting...");

  for (int value in sequence) {
    print(value);
  }
  print("DONE");
}

//sync* + yield* for recursive functions
Iterable<int> countDownFromSyncRecursive(int num) sync* {
  if (num > 0) {
    yield num;

    yield* countDownFromSyncRecursive(num - 1);
  }
}

void main4() {
  print("Getting CountDown Stream [async* + yield*]");
  Stream<int> sequence = countDownFromAsyncRecursive(5);

  print("Starting...");

  sequence.listen((int value) {
    print(value);
  });
  print("DONE");
}

//async* + yield* for recursive functions
Stream<int> countDownFromAsyncRecursive(int num) async* {
  if (num > 0) {
    yield num;

    yield* countDownFromAsyncRecursive(num - 1);
  }
}