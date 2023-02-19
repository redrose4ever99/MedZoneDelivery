import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medzonedelivery/core/app_export.dart';
import 'package:medzonedelivery/pages/orderdetails_screen/orderdetails_screen.dart';
import 'package:medzonedelivery/widgets/custom_button.dart';

import '../Log.dart';

// ignore: must_be_immutable
class ScheduleItemWidget extends StatelessWidget {
  ScheduleItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        "الدكتور محمد أحمد",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
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
                              textAlign: TextAlign.left,
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
                CustomButton(
                  height: 26,
                  width: 145,
                  text: "تعذر التسليم",
                  fontStyle: ButtonFontStyle.InterSemiBold12,
                ),
                CustomButton(
                    height: 26,
                    width: 145,
                    text: "تم التسليم",
                    fontStyle: ButtonFontStyle.InterSemiBold12,
                    onTap: () => onTapDetail(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapSignin(BuildContext context) {
    Get.to(Log());
  }

  onTapDetail(BuildContext context) {
    Get.to(OrderdetailsScreen());
  }
}
