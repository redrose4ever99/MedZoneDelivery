import 'package:dio/dio.dart';
import 'DeliveryMan.dart';
import 'Order.dart';

class DioConnection {
  Future<List<Order>> getData(DeliveryMan man) async {
    print("oooo");
    print(man.id);
    //
    // var response = await Dio().get('https://med.ma5znsyria.com/orders',

    var response = await Dio().get('http://med.ma5znsyria.com/personOrders',
        queryParameters: <String, dynamic>{'id': man.id});
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = response.data["data"][0];

      final list = response.data["data"] as List<dynamic>;

      return list.map((e) => Order.fromJson(e)).toList();
    } else
      return List.empty();
  }

  Future<List<DeliveryMan>> login(String mobile, password) async {
    try {
      var response = await Dio().get('https://med.ma5znsyria.com/person',
          queryParameters: <String, dynamic>{
            'mobile': mobile,
            'code': password,
          });
      if (response.statusCode == 200) {
        var data = response.data["data"][0];

        final list = response.data["data"] as List<dynamic>;
        print(response.data["data"][0]);
        return list.map((e) => DeliveryMan.fromJson(e)).toList();
        //insert data into ModelClass
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }

  void fetchAlbum2() async {
    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts/1');
    print(response);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // var res = json.decode(response);
      //insert data into ModelClass
      print("sucess");
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print("ere in fetch2");
    }
  }

  Future updateState(int id, int status, DeliveryMan man) async {
    try {
      var response = await Dio().get('http://med.ma5znsyria.com/editOrder',
          queryParameters: <String, dynamic>{
            'id': id,
            'status': status,
          });
      if (response.statusCode == 200) {
        print("status updated");
        DioConnection.new().getData(man);
        //insert data into ModelClass
      } else {
        // show error
        print("Try Again");
      }
    } catch (e) {
      print("errore data entry");
      print(e);
    }
  }
}
