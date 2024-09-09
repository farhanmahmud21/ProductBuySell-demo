class Product {
  String product_Name;
  double product_price;
  int counter;

  Product(
      {required this.product_Name,
      required this.product_price,
      this.counter = 0});

  void increase() {
    counter++;
  }
}
