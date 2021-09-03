//Using Generics in Dart

import 'dart:collection';

void main() {
  mainMap();
}

///Example #1: Demonstrating use of single letter and descriptive words for generics
//A class for grocery product
class Product {
  final int id;
  final double price;
  final String title;
  Product(this.id, this.price, this.title);

  @override
  String toString() {
    return "Price of ${this.title} is \$${this.price}";
  }
}

//A class for product's inventory
class Inventory {
  final int amount;

  Inventory(this.amount);

  @override
  String toString() {
    return "Inventory amount: $amount";
  }
}

//Custom type variables- Single letter
class Store<P, I> {
  final HashMap<P, I> catalog = HashMap<P, I>();

  List<P> get products => catalog.keys.toList();

  void updateInventory(P product, I inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach(
      (product) => print("Product: $product, " + catalog[product].toString()),
    );
  }
}

//Custom type variables- Descriptive
class MyStore<MyProduct, MyInventory> {
  final HashMap<MyProduct, MyInventory> catalog =
      HashMap<MyProduct, MyInventory>();

  List<MyProduct> get  products => catalog.keys;

  void updateInventory(MyProduct product, MyInventory inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach(
      (product) => print("Product: $product, " + catalog[product].toString()),
    );
  }
}

//Demonstrating single letter vs descriptive names for generics.
//Both variations have the same results.
void mainCustomParams() {
  Product milk = Product(1, 5.99, "Milk");
  Product bread = Product(2, 4.50, "Bread");

  //Using single letter names for Generics
  Store<Product, Inventory> store1 = Store<Product, Inventory>();
  store1.updateInventory(milk, Inventory(20));
  store1.updateInventory(bread, Inventory(15));
  store1.printProducts();

  //Using descriptive names for Generics
  MyStore<Product, Inventory> store2 = MyStore<Product, Inventory>();
  store2.updateInventory(milk, Inventory(20));
  store2.updateInventory(bread, Inventory(15));
  store2.printProducts();
}
//-------

//Example #2: Generics methods

//Function's return type (T).
//Function's argument (List<T>).
//Function's local variable (T last).
T lastItem<T>(List<T> products) {
  T last = products.last;
  return last;
}

mainGenericMethods() {
  Store<Product, Inventory> store = Store<Product, Inventory>();
  Product milk = Product(1, 5.99, "Milk");
  Product bread = Product(2, 4.50, "Bread");
  store.updateInventory(milk, Inventory(20));
  store.updateInventory(bread, Inventory(15));

  //Data type of `Product` is being used
  Product product = lastItem(store.products);
  print("Last item of Product type: ${product}");

  //Demonstrating using another type of data on same `lastItem()` method.
  List<int> items = List<int>.from([1, 2, 3, 4, 5]);
  int item = lastItem(items);
  print("Last item of int type: ${item}");
}
//-------

///Example #3: Using Generics for classes
//Restricting the type of values that can be supplied to the class.
//FreshProduce class can only accept of Product type when T extends Product
class FreshProduce<T extends Product> {
  FreshProduce(int i, double d, String s);

  String toString() {
    return "Instance of Type: ${T}";
  }
}

mainGenericClass() {
  //Using `Product` parameter accepted by FreshProduce class
  FreshProduce<Product> spinach = FreshProduce<Product>(3, 3.99, "Spinach");
  print(spinach.toString());

  //Passing
  FreshProduce spinach2 = FreshProduce(3, 3.99, "Spinach");
  print(spinach2.toString());

  //This code will give compile time error complaining that Object is not of type Product
//  FreshProduce<Object> spinach3 = FreshProduce<Object>(3, 3.99, "Spinach");
//  print(spinach3.toString());
}
//----

//List:
void mainList() {
  //using parameterized types with constructors
  List<int> theList = List<int>.from([1]);
  theList.add(2);
  theList.add(3);

  //Adding double data type will throw compile time error
  //theList.add(4.0);

  //iterate over list and print all items
  print("Printing items in Dart List");
  for (int item in theList) {
    print(item);
  }
}

//Queue:
void mainQueue() {
  //using parameterized types with constructors
  Queue<double> theQueue = Queue<double>.from([1.0]);
  theQueue.add(2.0);
  theQueue.add(3.0);

  //Adding String data type will throw compile time error
  //theQueue.add("4.0");

  print("Printing items in Dart Queue");
  //iterate over queue and print all items
  for (double item in theQueue) {
    print(item);
  }
}

//Set:
void mainSet() {
  Set<String> theSet = Set<String>.from({"1"});
  theSet.add("2");
  theSet.add("3");

  //Adding int data type will throw compile time error
  //theSet.add(3);

  print("Printing items in Dart Set");
  //iterate over set and print all items
  for (String item in theSet) {
    print(item);
  }
}

//Map:
void mainMap() {
  Map<int, String> theMap = {1: 'Dart'};
  theMap[2] = 'Flutter';

  //Adding int data type for String value will throw compile time error
  //theMap[3] = 3;

  print("Printing key:value pairs in Dart Map");
  //iterate over map and print all entries
  for (MapEntry mapEntry in theMap.entries) {
    print("${mapEntry.key} : ${mapEntry.value}");
  }
}