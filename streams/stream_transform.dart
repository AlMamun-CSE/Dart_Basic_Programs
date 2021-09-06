import 'dart:async';
import 'dart:convert';

void main() {
  example3();
}

//this is the stream generated above
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//This is how events are transformed and added to EventSink (output)
dataHandler(int event, EventSink<String> sink) {
  sink.add("The double of number $event is ${event * 2}");
}

//Stream of integer events is created.
//StreamTransformer prints the transformed event
void example1() {
  Stream<int> stream = createNumberStream(5);

  StreamTransformer transformer =
      StreamTransformer<int, String>.fromHandlers(handleData: dataHandler);

  stream.transform(transformer).listen((x) => print(x),
      onError: (err) => print("error: $err"), onDone: () => print("finished"));
}

//usingStreamController
void example2() {
  //StreamController is used to create Stream
  StreamController controller = StreamController<int>();

  StreamTransformer transformer =
      StreamTransformer<int, String>.fromHandlers(handleData: dataHandler);

  controller.stream.transform(transformer).listen((x) => print(x),
      onError: (err) => print("error: $err"), onDone: () => print("finished"));

  //Adding events to stream using StreamController
  controller.add(1);
  controller.add(2);
  controller.add(3);
  controller.add(4);
  controller.add(5);
}

void jsonDataHandler(String event, EventSink sink) {
  if (event.startsWith('data:')) {
    sink.add(json.decode(event.substring('data:'.length)));
  } else if (event.isNotEmpty) {
    sink.addError('Unexpected data format for Stream: "$event"');
  }
}

void example3() {
  StreamController controller = StreamController<String>();

  StreamTransformer transformer =
      StreamTransformer<String, dynamic>.fromHandlers(
          handleData: jsonDataHandler);

  controller.stream.transform(transformer).listen((x) => print(x),
      onError: (err) => print("error: $err"), onDone: () => print("finished"));

  controller.add('data:{"first":"Priyanka", "last":"Tyagi"}');
}
