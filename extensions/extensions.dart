import 'extensions2.dart' hide MyList;

extension<T> on List<T> {
  //Extension Method: demo
  List<T> priceList() => this.map((item) => item).toList();

  //Extension Method: Adding $ prefix
  List<String> priceLabels(String symbol) =>
      this.map((item) => "$symbol ${item}").toList();

  //Extension Operator: Hike up the price by n
  List<num> operator ^(int n) =>
      this.map((item) => num.parse("${item}") * n).toList();

  //Extension Operator: Reduce all prices by half
  List<num> operator -() =>
      this.map((item) => num.parse("${item}") / 2).toList();

  //Extension Property: 3 printed labels for each price.
  int get numPrintedPriceTags => length * 3;
}

void main() {
  //List of prices
  List prices = [1, 1.99, 4];

 print("Price listing:");
 print(prices.priceList());

 print("\nPrice listing with \$ prefix");
 print(prices.priceLabels("\$"));

 print("\nPrice listing after hiking up prices 3x of the original value");
 print(prices ^ 3);

 print(
     "\nSale Price listing: prices are reduced by half of the original value");
  print(-prices);

 print("\nNumber of total price tags");
 print(prices.numPrintedPriceTags);
}
