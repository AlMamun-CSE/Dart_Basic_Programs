extension MyList<T> on List<T> {
  //Extension Method: Adding $ prefix
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