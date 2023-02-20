import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medzonedelivery/classes/DioConnection.dart';
import 'package:medzonedelivery/classes/DeliveryMan.dart';
import 'package:medzonedelivery/widgets/custom_button.dart';
import 'package:medzonedelivery/widgets/custom_text_form_field.dart';
import 'package:medzonedelivery/core/app_export.dart';
import 'package:medzonedelivery/pages/orderlist_screen/orderlistpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
              body: Column(
                children: [
                  Container(
                      width: size.width,
                      padding:
                          getPadding(left: 15, top: 55, right: 15, bottom: 35),
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
                                width: 600,
                                text: "دخول",
                                margin: getMargin(top: 27),
                                fontStyle:
                                    ButtonFontStyle.InterSemiBold14Gray700,
                                onTap: () {
                                  if (validateMobile(
                                          phoneFormController.text) !=
                                      null) {
                                    print("taped now");
                                    login(phoneFormController.text,
                                        codeFormController.text, context);
                                  } else {
                                    alertEmptyPhone(context);
                                  }
                                })
                          ])),
                ],
              ),
            )));
  }

//
//
  void login(String mobile, password, BuildContext context) async {
    List<DeliveryMan> list = List.empty();
    try {
      list = await DioConnection.new().login(mobile, password);
      if (list.isEmpty) {
        print("Try Again");
        alertFirst(context);

        //insert data into ModelClass
      } else {
        print(list[0].name);
        print(list[0].id);
        onTapOrderList(context, list[0]);
        // show error
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
  //var url = Uri.http("example.org", "/my/service/path", {"getUrlParam1":"value"});
}
