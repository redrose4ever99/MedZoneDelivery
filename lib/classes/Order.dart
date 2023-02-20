// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  int? id;
  String? code;
  String? title;
  String? status;
  String? total;
 //List<Product>? products;

  Order(this.id, this.code, this.status, this.total);
  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    status = json['status'];
    total = json['total'];
 //  products=getProductList(json['products']);

    //
  //  final list = response.data["data"] as List<dynamic>;

    //return list.map((e) => DeliveryMan.fromJson(e)).toList();

  }

  List<Product>? getProductList(json) {
    final List  list= json as List<dynamic>;
    print("product is");
    print(list);
    return list.map((e) => Product.fromJson(e)).toList();

  }
}
//[{"offer":"21","price":"24000.0","amount":"6","product":"31"}]

class Product {
  int? offer;
  int? amount;
  int? id;
  double? price;

  Product(this.offer, this.amount, this.id, this.price);

  Product.fromJson(Map<String, dynamic> json) {
    offer = json['offer'];
    amount = json['amount'];
    id = json['product'];
    price = json['price'];
  }
}
