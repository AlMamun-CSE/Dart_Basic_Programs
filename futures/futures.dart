//Entry point function

void main() {
  //Run Example#1.
  makeDataCall();

  //Run Example#2.
  //makeDataCallWithException();

  //Run Example#3.
  //sequencingOperations();

  //Run Example#4.
  //mainWithFutureAPI();

  //Run Example#5.
  //mainWithFutureAPIVoid();

  //Run Example#6.
  //mainWithFutureAPIError();

  //Run Example#7.
  //mainWithFutureAPIWait();
}

//Example#1. Fetching data asynchronously

// Expensive function could be a function that takes
// long time to process data and return results.
// Assume this function takes long time to return in real-world.
String getExpansiveData() {
  return "I'm expansive data";
}

// This is the asynchronous function that makes the expensive
// data call and prints the results.
Future<void> makeDataCall() async {
  var data = await getExpansiveData();
  print(data);
}
//----END----//

//Example#2. Demonstrating handling exception thrown in asynchronous operations

//Expansive operations ended up throwing exception
String getExpansiveDataWithException() {
  throw Exception("Error occurred in fetching data");
}

//Asynchronous function that makes the expensive data call
Future<void> makeDataCallWithException() async {
  try {
    await getExpansiveDataWithException();
  } catch (e) {
    print(e.toString());
  }
}
//----END----//

//Example#3. Sequencing order of asynchronous calls

void getDataA() {
  print("dataA");
}

void getDataB() {
  print("dataB");
}

String getDataC() {
  return "dataC";
}

//Entry point function
Future<void> sequencingOperations() async {
  //Order matters.
  //Functions will execute in the order they were called.
  await getDataA();
  await getDataB();

  //getDataC() will execute first and will
  //pass its data into print() function
  print(await getDataC());
}
//----END----//

//Example #4. Using Future API (Future is returning String type)

//Future with String data is being returned.
//This function returns the instance of
//Future and not the actual data.
Future<String> makeDataCallFutureString() async {
  return await getExpansiveData();
}

void mainWithFutureAPI() {
  var theFuture = makeDataCallFutureString();

  //then() is called at the instance of Future
  theFuture.then((value) {
    print(value);
  });
}
//----END----//

//Example#5. Using Future API (Future is returning void type)

//Future doesn't return anything
Future<void> makeDataCallFutureVoid() async {
  await getExpansiveData();
}

void mainWithFutureAPIVoid() {
  var theFuture = makeDataCallFutureVoid();
  //then() uses underscore as unused argument.
  theFuture.then((_) {
    //_ is not used
    print("There's nothing to be printed here. Work is already done.");
  });
}
//----END----//

//Example#6. Future API - Error Handling

//Future with String data is being returned.
//This function returns the instance of
//Future and not the actual data.
Future<String> makeDataCallFutureAPIError() async {
  var data = await getExpansiveData();
  throw Exception("Error occurred in making data call: $data");
}

void mainWithFutureAPIError() {
  var theFuture = makeDataCallFutureAPIError();

  //Error is caught and handled in catchError block
  theFuture.then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  });
}
//----END----//

//Example#7. Using `Future.wait()`

String getData(data) {
  return data;
}

Future<String> getDataAFuture() async {
  return await getData("dataA");
}

Future<String> getDataBFuture() async {
  return await getData("dataB");
}

Future<String> getDataCFuture() async {
  return await getData("dataC");
}

mainWithFutureAPIWait() async {
  //Chaining Futures in order
  await Future.wait([
    getDataAFuture(),
    getDataBFuture(),
    getDataCFuture(),
  ])
      .then(
        (List responses) => print(responses),
      )
      .catchError((error) => print(error));
}
//----END----//
