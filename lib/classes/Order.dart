// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  final int id;
  final String code;
  final String title;
  final String status;
  final double total;
  final Product products;


  Order(this.id, this.code, this.title, this.status, this.total, this.products);

  factory Order.fromJson(Map<String, dynamic> json) {
    var order2 = Order(
      json['id'],
       json['code'],
     json['title'],
      json['status'],
       json['total'],
      Product.fromJson(json['products']),
    );
    var order = order2;
    return order;
  }
}
//[{"offer":"21","price":"24000.0","amount":"6","product":"31"}]

class Product {
  late int offer;
  late int amount;
  late int id;
  late double price;

  Product(this.offer, this.amount, this.id, this.price);


  factory Product.fromJson(Map<String, dynamic> json) {
    var product = Product(
       json['offer'],
       json['amount'],
      json['product'],
     json['price'],
    );

    return product;
  }
}
