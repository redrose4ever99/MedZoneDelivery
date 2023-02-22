// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  int? id;
  String? code;
  String? title;
  String? status;
  String? total;
  String? order_date;
  List<dynamic>? productjson;
  List<Product>? products;
  String? customer_full_name;
  String? customer_business_name;
  String? customer_mobile;
  String? customer_land_phone;
  String? customer_details_address;
 //List<Product>? products;

  Order(this.id, this.code, this.status, this.total);
  Order.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      code = json['code'];
      status = json['status'];
      total = json['total'];
      customer_full_name = json['customer']['full_name'];
      customer_mobile = json['customer']['mobile'];
      customer_business_name = json['customer']['business_name'];
      customer_land_phone = json['customer']['land_phone'];
      customer_details_address = json['customer']['detailed_address'];
      order_date = json['created_at'];
      productjson=json['products'];
      //products=json['products'];

      print(customer_full_name);
      print(customer_mobile);
      print(customer_business_name);
      print(customer_land_phone);
      print(customer_details_address);
      print(productjson);

      //print( getProductList(json['products']));
    } catch(e){

      print(e.toString());}
  }

  Future<List<Product>>? getProductList(Order order)  async{
    final list= order.productjson as List<dynamic>;
    var x=list.map((e) => Product.fromJson(e)).toList();
    print("product is");
    print(x[0].offer);
    return x;

  }
}
//[{"offer":"21","price":"24000.0","amount":"6","product":"31"}]

class Product {
  String? offer;
  String? amount;
  String? id;
  String? price;

  Product(this.offer, this.amount, this.id, this.price);


  Product.fromJson(Map<String, dynamic> json) {
    try {
      offer = json['offer'];
      amount = json['amount'];
      id = json['product'];
      price = json['price'];

    } catch(e){

      print(e.toString());}
  }




}

class Customer{
  int? id;
  int? code;
  String? full_name;
  String? business_name;
  String? mobile;
  String? land_phone;
  String? details_address;

  Customer(this.id, this.code, this.full_name, this.business_name, this.mobile,
      this.land_phone, this.details_address);

  Customer.fromJson(Map<String, dynamic> json) {
    id =json["id"];
    code=json["code"];
    full_name= json["full_name"];
    business_name=json["business_name"];
    mobile= json["mobile"];
    land_phone=json["land_phone"];
    details_address=json["details_address"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "full_name": full_name,
    "business_name": business_name,
    "mobile": mobile,
    "land_phone": land_phone,
    "details_address": details_address,




  };
}

