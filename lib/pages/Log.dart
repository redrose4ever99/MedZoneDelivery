import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medzonedelivery/widgets/custom_button.dart';
import 'package:medzonedelivery/widgets/custom_text_form_field.dart';
import 'package:medzonedelivery/core/app_export.dart';
import 'package:medzonedelivery/pages/orderlistpage.dart';
import 'package:dio/dio.dart';
import 'package:medzonedelivery/widgets/custom_textphone_form_field.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Log extends StatelessWidget {
  TextEditingController phoneFormController = TextEditingController();

  TextEditingController codeFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              resizeToAvoidBottomInset: false,
              body: Container(
                  width: size.width,
                  padding: getPadding(left: 15, top: 55, right: 15, bottom: 35),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.medzone,
                            height: getVerticalSize(100.00),
                            width: getHorizontalSize(200.00),
                            margin: getMargin(top: 70)),
                        Padding(
                            padding: getPadding(top: 64),
                            child: Text(" مرحبا بك في  MedZone",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right)),
                        CustomTextPhoneFormField(
                            width: 343,

                            controller: phoneFormController,
                            focusNode: FocusNode(),
                            hintText: "أدخل رقما مثل 0991231234",
                            margin: getMargin(top: 28),
                            textInputType: TextInputType.phone,
                            prefix: Container(
                                margin: getMargin(
                                    left: 16, top: 12, right: 10, bottom: 12),
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgCall)),
                            prefixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(48.00))),
                        CustomTextFormField(
                            width: 343,
                            focusNode: FocusNode(),
                            controller: codeFormController,
                            hintText: "ادخل الرمز",
                            margin: getMargin(top: 8),
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            prefix: Container(
                                margin: getMargin(
                                    left: 16, top: 12, right: 10, bottom: 12),
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgLock)),
                            prefixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(48.00)),
                            isObscureText: true),
                        CustomButton(
                            height: 50,
                            width: 600,
                            text: "دخول",
                            margin: getMargin(top: 27),
                            fontStyle: ButtonFontStyle.InterSemiBold14Gray700,
                            onTap: () {
                              if (validateMobile(phoneFormController.text) !=
                                  null) {
                                print("taped now");
                                login(phoneFormController.text,
                                    codeFormController.text, context);
                              }
                              else {
                                alertEmptyPhone(context);
                              }
                            })
                      ])),
            )));
  }

//
//
  void login(String mobile, password, BuildContext context) async {
    try {
      var response = await Dio().get('https://med.ma5znsyria.com/person',
          queryParameters: <String, dynamic>{
            'mobile': mobile,
            'code': password,
          });
      if (response.statusCode == 200) {
        onTapOrderList(context);
        //insert data into ModelClass
      } else {
        // show error
        print("Try Again");
        alertFirst(context);
      }
    } catch (e) {
      print("errore data entry");
      print(e);
      alertFirst(context);
    }
  }

  alertFirst(BuildContext context) {
    Fluttertoast.showToast(
      msg: "خطأ في البيانات المدخلة",
    );
  }
  alertEmptyPhone(BuildContext context) {
    Fluttertoast.showToast(
      msg: " فضلا أدخل رقم الهاتف  ",
    );
  }

  Positioned drawCircle(double myDeviceWidth) {
    return Positioned(
      top: 300,
      right: myDeviceWidth / 1.5,
      child: Container(
        height: myDeviceWidth,
        width: myDeviceWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(myDeviceWidth),
          color: Color.fromARGB(255, 8, 226, 143).withOpacity(0.5),
        ),
      ),
    );
  }

  onTapOrderList(BuildContext context) {
    Get.to(Orderlist());
  }

  void fetchAlbum1() async {
    var response =
        //https://jsonplaceholder.typicode.com/posts/1
        await Dio().get('http://med.ma5znsyria.com/orders',
            queryParameters: <String, dynamic>{
          'id': '3',
        });
    // var url = Uri.http("https://med.ma5znsyria.com", "/orders", {"id": "1"});
    //final response = await http.get(url);
    // final response = await http.get(Uri.parse('https://med.ma5znsyria.com/orders?id=3'));
    //print(response.data.toString());
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print(response.data.toString());
      //insert data into ModelClass
      print("true job");
    } else if (response.data == 404) print("false entry");
    {
      Fluttertoast.showToast(
        msg: "This is wrong Entry",
      );
    }
  }

  String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }
  //var url = Uri.http("example.org", "/my/service/path", {"getUrlParam1":"value"});

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
}
