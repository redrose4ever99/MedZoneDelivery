import 'package:flutter/material.dart';
import 'package:medzonedelivery/core/app_export.dart';

// ignore: must_be_immutable
class CartItemWidget extends StatelessWidget {
  CartItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        all: 14,
      ),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              right: 42,
              top: 2,
              bottom: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "دكتور محمد الحمد",
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.txtInterSemiBold,
                ),
                Padding(
                  padding: getPadding(
                    top: 3,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgLocation,
                        height: getSize(
                          25.00,
                        ),
                        width: getSize(
                          25.00,
                        ),
                      ),
                      Text(
                        "جرمانا الجناين",
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.txtInterMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 25,
                  ),
                  child: Row(
                    children: [

                      Padding(
                        padding: getPadding(
                          left: 10,
                        ),
                        child: Text(
                          "الكمية  1",
                          style: AppStyle.txtInterSemiBold,
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
              left: 33,
              top: 55,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    top: 47,
                  ),
                  child: Text(
                "4000 ل.س",
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtInterSemiBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
