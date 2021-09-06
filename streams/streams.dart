void main() {
  //Run Example#1.
  //createStreamUsingGenerators();

  //Run Example#2.
  //createStreamFromIterable();

  //Run Example#3.
  //printStreamEventsUsingListen();

  //Run Example#4.
  //printStreamEventsUsingAwaitFor();

  //Run Example#5.
  //addNumbersInStream();

  //Run Example#6.
  //handlingExceptionUsingAwaitFor();

  //Run Example#7.
  handlingExceptionUsingListen();
}

//Example#1. Creating Stream (of numbers) using asynchronous Generators
//Using yield, async*

//This will return a reference to the stream
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Printing numbers/events of Stream (Listening to Stream)
printStream(Stream stream) {
  stream.listen((s) => print(s));
}

void createStreamUsingGenerators() async {
  //Using `yield`, async* keywords
  var stream = createNumberStream(5);
  printStream(stream);
}
//----END----//

//Example#2. Creating Stream of numbers using  `Stream.fromIterable()` method

void createStreamFromIterable() {
  var numbers = [1, 2, 3, 4, 5];
  Stream stream = Stream.fromIterable(numbers);
  printStream(stream);
}
//----END----//

//Example#3. Accessing Stream using `listen`

void printStreamEventsUsingListen() {
  Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  print("Stream Starting");
  stream.listen(
    (s) => print(s),
  );
  print("Stream Finished");
}
//----END----//

//Example#4. Accessing Stream using `await for`

void printStreamEventsUsingAwaitFor() async {
  Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  print("Stream Starting");
  await for (var num in stream) {
    print(num);
  }
  print("Stream Finished");
}
//----END----//

//Example#5. Processing (Adding) Stream using `await for`

void addNumbersInStream() async {
  //Create a Stream consists of numbers
  Stream stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  var total = await addEvents(stream);
  print(total);
}

//Receiving events from Stream, adding and returning total
Future<int> addEvents(Stream<int> stream) async {
  var total = 0;
  await for (var num in stream) {
    total += num;
  }

  return total;
}
//----END----//

///Handling Exceptions (Code shared for listen and await for implementations)

//Generated Stream with numbers. Added exception on purpose for demonstration
Stream<int> createNumberStreamWithException(int last) async* {
  for (int i = 1; i <= last; i++) {
    if (i == 5) {
      throw new Exception("Demo exception when accessing 5th number");
    }
    yield i; //to be able to send spaced out events
  }
}

//Example #6. Handle Error in Stream using `await for`
void handlingExceptionUsingAwaitFor() async {
  var stream = createNumberStreamWithException(5);
  try {
    await for (var num in stream) {
      print(num);
    }
  } catch (e) {
    print(e);
  }
  print("Finished");
}
//----END----//

//Example #7. Handle Error in Stream using `listen`
void handlingExceptionUsingListen() async {
  var stream = createNumberStreamWithException(5);
  stream.listen(
    (num) => print(num),
    onError: (e) => print(e),
    onDone: () => print("Finished"),
  );
}
//----END----//
