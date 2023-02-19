import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../orderdetails_screen/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:medzonedelivery/core/app_export.dart';
import 'package:medzonedelivery/widgets/app_bar/appbar_image.dart';
import 'package:medzonedelivery/widgets/app_bar/custom_app_bar.dart';
import 'package:medzonedelivery/widgets/custom_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../orderlistpage.dart';

class OrderdetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              appBar: CustomAppBar(
                  height: getVerticalSize(56.00),
                  leadingWidth: 45,
                  leading: AppbarImage(
                      height: getSize(24.00),
                      width: getSize(24.00),
                      svgPath: ImageConstant.imgArrowdownGray700,
                      margin: getMargin(right: 21, top: 16, bottom: 16),
                      onTap: () => onTapArrowdown(context)),
                  centerTitle: true,
                  title: Text("تفاصيل الطلب",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterSemiBold16)),
              body: GestureDetector(
                  onTap: () {
                    alertFirst(context);
                  },
                  child: Container(
                      width: size.width,
                      padding:
                          getPadding(left: 20, top: 24, right: 10, bottom: 24),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: getPadding(left: 1),
                                child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          height: getVerticalSize(25.00));
                                    },
                                    itemCount: 2,
                                    itemBuilder: (context, index) {
                                      return CartItemWidget();
                                    }))
                          ]))),
              bottomNavigationBar: Padding(
                  padding: getPadding(left: 20, right: 20, bottom: 26),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(top: 4, bottom: 4),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("الاجمالي",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14),
                                  Padding(
                                      padding: getPadding(top: 1),
                                      child: Text("\$ 20.98",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold18))
                                ])),
                        CustomButton(height: 50, width: 192, text: "تم التسليم"),
                      ]))),
        ));
  }

  alertFirst(BuildContext context) {
    Fluttertoast.showToast(
      msg: "this is first alert",
    );
  }

  onTapArrowdown(BuildContext context) {
    Get.to(Orderlist());
  }
}
