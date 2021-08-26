// Future<void> printOrderMessage() async {
//   print('Awaiting user order...');
//   var order = await fetchUserOrder();
//   print('Your order is: $order');
// }

void createOrderMessage()async{
  print('Awaiting user order...');
  var order = await fetchUserOrder();
  print('Your order is: $order');
}

Future<String>fetchUserOrder(){
  return Future.delayed(const Duration(seconds: 4),
    ()=> 'Large Latte',
  );
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
  

void main(){
  createOrderMessage();
  countSeconds(4);
}