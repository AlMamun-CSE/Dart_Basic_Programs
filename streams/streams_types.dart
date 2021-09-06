import 'dart:async';

void main() {
  //Run Example#1.
  //subscribeUsingListen();

  //Run Example#2.
  //subscribeUsingSubscriptionHandler();

  //Run Example#3.
  //filterUsingWhere();

  //Run Example#4.
  //first();

  //Run Example#5.
  //last();

  //Run Example#6.
  //length();

  //Run Example#7.
  //isEmpty();

  //Run Example#8.
  //broadcastStreamBasicOperations();

  //Run Example#9.
  //broadcastStreamTake();

  //Run Example#10.
  //broadcastStreamSkip();

  //Run Example#11.
  //broadcastStreamTakeWhile();

  //Run Example#12.
  //broadcastStreamSkipWhile();

  //Run Example#13
  modifyStreamUsingTransform();
}

//This will generate a stream and return reference to it.
Stream<int> createNumberStreamWithException(int last) async* {
  for (int i = 1; i <= last; i++) {
    if (i == 5) {
      throw new Exception("Demo exception when accessing 5th number");
    }
    yield i; //to be able to send spaced out events
  }
}

//Example#1. Subscribing to Stream using `listen()` method
void subscribeUsingListen() {
  Stream stream = createNumberStreamWithException(5);

  stream.listen(
    (x) => print("number: $x"),
    onError: (err) => print("error: $err"),
    onDone: () => print("Done"),
  );
}
//----END----//

//Example#2. Subscribing to Stream using subscription handler
void subscribeUsingSubscriptionHandler() {
  Stream stream = createNumberStreamWithException(5);

  var subscription = stream.listen(null);
  subscription.onData((x) => print("number $x"));
  subscription.onError((err) => print("error: $err"));
  subscription.onDone(() => print("Done"));
}
//----END----//

//This will generate a stream and return reference to it.
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Example#3. Demonstrating usage of `where()`
void filterUsingWhere() {
  var stream = createNumberStream(5);
  stream
      .where((x) => x > 3) //Filters numbers greater than 3
      .listen((x) => print(x)); //prints numbers filtered
}
//----END----//

//Example#4. Demonstrating usage of `first`
void first() {
  var stream = createNumberStream(5);

  //print the first number/event
  stream.first.then(
    (x) => print("First event: $x"),
  );
}
//----END----//

//Example#5. Demonstrating usage of `last`
void last() {
  //A fresh stream is needed.
  //Single subscription stream can't be re-listened.
  var stream = createNumberStream(5);
  //print the last number/event
  stream.last.then((x) => print("Last event: $x"));
}
//----END----//

//Example#6. Demonstrating usage of `length`
void length() {
  var stream = createNumberStream(5);
  //print the length of the stream
  stream.length.then((x) => print("Length of Stream: $x"));
}
//----END----//

//Example#7. Demonstrating usage of `isEmpty`
void isEmpty() {
  var stream = createNumberStream(5);
  //Check if stream is empty
  stream.isEmpty.then((x) => print("Is Empty : $x"));

  //Create an empty stream
  stream = createNumberStream(0);
  //Verify an empty stream
  stream.isEmpty.then((x) => print("Is Empty : $x"));
}
//----END----//

//Example#8. Demonstrating BroadcastStream basic operations
void broadcastStreamBasicOperations() {
  var stream = createNumberStream(5);

  //Converting to broadcastStream
  var bStream = stream.asBroadcastStream();

  //check if stream is broadcast stream or single
  if (bStream.isBroadcast) {
    print("Broadcast Stream");
  } else {
    print("Single Stream");
  }
  //print the first number/event
  bStream.first.then((x) => print("First event: $x"));

  //print the last number/event
  bStream.last.then((x) => print("Last event: $x"));

  //print the length of the stream
  bStream.length.then((x) => print("Length of Stream: $x"));

  //Check if stream is empty
  bStream.isEmpty.then((x) => print("Is Empty : $x"));

  //empty stream on purpose
  stream = createNumberStream(0);
  bStream = stream.asBroadcastStream();
  bStream.isEmpty.then((x) => print("Is Empty : $x"));
}
//----END----//

//Example#9. Demonstrating BroadcastStream `take()` method
void broadcastStreamTake() {
  var stream = createNumberStream(5);

  //Converting to broadcastStream
  var bStream = stream.asBroadcastStream();

  //Creates a sub stream of 2 elements and
  //listen on it
  bStream.take(2).listen(
        (x) => print("take() : $x"),
      );
}
//----END----//

//Example#10. Demonstrating BroadcastStream `skip()` method
void broadcastStreamSkip() {
  var stream = createNumberStream(5);

  //Converting to broadcastStream
  var bStream = stream.asBroadcastStream();

  //skips first two numbers from [1,2,3,4,5]
  bStream.skip(2).listen(
        (x) => print("skip() : $x"),
      );
}
//----END----//

//Example#11. Demonstrating BroadcastStream `takeWhile()` method
void broadcastStreamTakeWhile() {
  var stream = createNumberStream(5);

  //Converting to broadcastStream
  var bStream = stream.asBroadcastStream();

  //Creates a sub-stream of items less than 3, and prints the sub-stream of [1,2].
  bStream.takeWhile((x) => x > 0 && x < 3).listen(
        (x) => print("takeWhile() : $x"),
      );
}
//----END----//

//Example#12. Demonstrating BroadcastStream `skipWhile()` method
void broadcastStreamSkipWhile() {
  var stream = createNumberStream(5);

  //Converting to broadcastStream
  var bStream = stream.asBroadcastStream();

  //skips elements which are positive and
  //less than 3, and prints rest.
  bStream
      .skipWhile((x) => x > 0 && x < 3)
      .listen((x) => print("skipWhile() : $x"));
}
//----END----//

//Example#13. Demonstrating modifying a stream using `transform()` method
void modifyStreamUsingTransform() {
  //Stream of integer events is created.
  var stream = createNumberStream(5);

  //StreamTransformer prints the transformed event
  var transformer =
      StreamTransformer<int, String>.fromHandlers(handleData: (value, sink) {
    sink.add("My number is $value");
  });

  stream.transform(transformer).listen(
        (x) => print(x),
        onError: (err) => print("error: $err"),
        onDone: () => print("Done"),
      );
}
//----END----//
