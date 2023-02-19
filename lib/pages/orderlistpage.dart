//import '../orderlist_page/widgets/schedule_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medzonedelivery/core/utils/color_constant.dart';
import 'package:medzonedelivery/core/utils/image_constant.dart';
import 'package:medzonedelivery/core/utils/size_utils.dart';
import 'package:medzonedelivery/core/app_export.dart';
import 'package:medzonedelivery/pages/orderdetails_screen/orderdetails_screen.dart';
import 'package:medzonedelivery/widgets/app_bar/appbar_image.dart';
import 'package:medzonedelivery/widgets/app_bar/custom_app_bar.dart';

import '../widgets/custom_button.dart';

// ignore_for_file: must_be_immutable

class Orderlist extends StatelessWidget {
  //
  var orders=[{
    'id':1,
    'code':'P76534',
    'title':'title',
    'status':'3',
    'total':'345560',
      },{
    'id':2,
    'code':'u656534',
    'title':'title2',
    'status':'3',
    'total':'345560',
  }];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
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
              title: Text("قائمة الطلبات",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold16)),
          body: ListView.builder(
              itemCount: 23,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  // When the user taps the button, show a snackbar.
                  onTap: () { onTapNotDelivery(context);
                  },
                  child: Container(
                    padding: getPadding(
                      all: 15,
                    ),
                    decoration: AppDecoration.outlineBluegray501.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            right: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: getPadding(
                                  bottom: 2,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                    "irehrfhjeb",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: AppStyle.txtInterSemiBold18,
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 2,
                                      ),
                                      child: Row(
                                        children: [
                                          CustomImageView(
                                            svgPath: ImageConstant.imgLocation,
                                            height: getSize(
                                              15.00,
                                            ),
                                            width: getSize(
                                              15.00,
                                            ),
                                          ),
                                          Text(
                                            "جرمانا الجناين",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: AppStyle.txtInterMedium12Gray700,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 1,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgCalendar15x15,
                                height: getSize(
                                  10.00,
                                ),
                                width: getSize(
                                  10.00,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 5,
                                ),
                                child: Text(
                                  "26/06/2021",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium12Gray700,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgClock15x15,
                                height: getSize(
                                  10.00,
                                ),
                                width: getSize(
                                  10.00,
                                ),
                                margin: getMargin(
                                  left: 14,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 5,
                                ),
                                child: Text(
                                  "10:30 AM",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium12Gray700,
                                ),
                              ),
                              Container(
                                height: getSize(
                                  4.00,
                                ),
                                width: getSize(
                                  4.00,
                                ),
                                margin: getMargin(
                                  left: 12,
                                  top: 2,
                                  bottom: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.green300,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      3.00,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 5,
                                ),
                                child: Text(
                                  "بانتظار التسليم",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium12Gray700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 7,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(height: 50, width: 150, text: "تم التسليم",onTap:() => onTapDelivery(context) ,),
                              CustomButton(height: 50, width: 150, text: "تعذر التسليم ",onTap:()=> onTapNotDelivery(context) ,),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  alert(BuildContext context,String str) {
    Fluttertoast.showToast(
      msg:str,
      backgroundColor:ColorConstant.medzonebackground,
    );
  }

  goToDetails(BuildContext context, int index) {

Get.to(OrderdetailsScreen());
  }

  onTapNotDelivery(BuildContext context) {
    Get.to(OrderdetailsScreen());
  }

  onTapDelivery(BuildContext context) {}

  onTapArrowdown(BuildContext context) {}
}
