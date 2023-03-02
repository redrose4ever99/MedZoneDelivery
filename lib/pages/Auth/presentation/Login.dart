// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medzonedelivery/classes/DioConnection.dart';
import 'package:medzonedelivery/classes/DeliveryMan.dart';
import 'package:medzonedelivery/pages/orderlist_screen/orderlistpage.dart';
import 'package:medzonedelivery/widgets/custom_button.dart';
import 'package:medzonedelivery/widgets/custom_text_form_field.dart';
import 'package:medzonedelivery/core/app_export.dart';

import 'package:medzonedelivery/widgets/custom_textphone_form_field.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Login extends StatelessWidget {
  TextEditingController phoneFormController = TextEditingController();

  TextEditingController codeFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHieght = MediaQuery.of(context).size.height;

    return SafeArea(
        top: false,
        bottom: false,
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Container(
                      width: size.width,
                      padding:
                          getPadding(left: 15, top: 15, right: 15, bottom: 15),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.medzone,
                                height: screenHieght * 0.3 / 2,
                                width: screenWidth * 0.6,
                                //  height: getVerticalSize(100.00),
                                // width: getHorizontalSize(200.00),
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
                                        left: 16,
                                        top: 12,
                                        right: 10,
                                        bottom: 12),
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
                                        left: 16,
                                        top: 12,
                                        right: 10,
                                        bottom: 12),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgLock)),
                                prefixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(48.00)),
                                isObscureText: true),
                            CustomButton(
                                height: 50,
                                width: 300,
                                text: "دخول",
                                margin: getMargin(top: 27),
                                fontStyle:
                                    ButtonFontStyle.InterSemiBold14Gray700,
                                onTap: () {
                                  print("taped now");
                                  login(phoneFormController.text,
                                      codeFormController.text, context);
                                })
                          ])),
                ],
              ),
            )));
  }

  void login(String mobile, password, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
            color: ColorConstant.medzonebackground,
            backgroundColor: Colors.white70,
          ));
        });

    DeliveryMan list = new DeliveryMan();
    try {
      list = await DioConnection.new().login(mobile, password);
      if (list.id == null) {
        print("Try Again");
        alertFirst(context);

        //insert data into ModelClass
      } else {
        Navigator.of(context).pop();
        print(list.name);
        print(list.id);
        savePreferences(list);
        onTapOrderList(context, list);

        // show error
      }
    } catch (e) {
      print("errore data entry");
      print(e);
      alertFirst(context);
      Navigator.of(context).pop();
    }
  }

  alertFirst(BuildContext context) {
    Fluttertoast.showToast(
      msg: "خطأ في البيانات المدخلة",
    );
    Navigator.of(context).pop();
  }

  alertEmptyPhone(BuildContext context) {
    Fluttertoast.showToast(
      msg: "رقم الهاتف 10 خانات  ",
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

  onTapOrderList(BuildContext context, DeliveryMan man) {
    print(man.id);
    Get.to(() => OrderList(
          deliveryMan: man,
        ));
  }

  String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  void savePreferences(DeliveryMan list) {}
  //var url = Uri.http("example.org", "/my/service/path", {"getUrlParam1":"value"});
}
