//sync Example
void main(){
  print("Generate Numbers");
  Iterable<int> numbers = getNumbers(6);
  print("Generating Number");
  for (var val in numbers) {
    print('$val');
  }
  print("end of main");
}

Iterable<int> getNumbers(int number)sync*{
  print("generator started");
  for(int i = 0; i <= number; i++){
    yield i;
  }
  print("generator ended");
}