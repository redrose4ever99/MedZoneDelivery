import '../../classes/Order.dart';
import '../orderdetails_screen/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:medzonedelivery/core/app_export.dart';
import 'package:medzonedelivery/widgets/app_bar/appbar_image.dart';
import 'package:medzonedelivery/widgets/app_bar/custom_app_bar.dart';
import 'package:medzonedelivery/widgets/custom_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderdetailsScreen extends StatelessWidget {
  const OrderdetailsScreen({super.key, required this.order});
  final Order order;


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
                  title: Row(
                    children: [
                      Text("طلب : ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold),
                      Text(order.customer_full_name.toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold),
                    ],
                  )



              ),
              body:

                      Card(
                        color: ColorConstant.medzonebackground,
                        child: Container(
          child: FutureBuilder(
          future: order.getProductList(order) ,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Center(
                              child: Text("جاري التحميل ..."),
                            ),
                          );
                        } else {
                          var items = snapshot.data;

                          return ListView.builder(
                              itemCount: items == null ? 0 : items.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return  Container(
                                      padding: getPadding(
                                        all: 15,
                                      ),
                                      decoration:
                                      AppDecoration.outlineBluegray501.copyWith(
                                        borderRadius:
                                        BorderRadiusStyle.roundedBorder8,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              right: 8,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: getPadding(
                                                    bottom: 2,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Row(

                                                        children: [

                                                          Container(
                                                            width: width/4,
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "العرض ",
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign.right,
                                                                  style: AppStyle
                                                                      .txtInterSemiBold18,
                                                                ),
                                                                Text(
                                                                  items[index]
                                                                      .offer
                                                                      .toString(),
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign.right,
                                                                  style: AppStyle
                                                                      .txtInterSemiBold18,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: width/4,
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "الكمية ",
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign.right,
                                                                  style: AppStyle
                                                                      .txtInterSemiBold18,
                                                                ),
                                                                Text(
                                                                  items[index]
                                                                      .amount
                                                                      .toString(),
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign.right,
                                                                  style: AppStyle
                                                                      .txtInterSemiBold18,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: width/4,
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "السعر ",
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign.right,
                                                                  style: AppStyle
                                                                      .txtInterSemiBold18,
                                                                ),
                                                                Text(
                                                                  items[index]
                                                                      .price
                                                                      .toString(),
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign.right,
                                                                  style: AppStyle
                                                                      .txtInterSemiBold18,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          ],

                                                      ),


                                                    ],

                                                  ),

                                                ),

                                                ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    );
                              });
                        }
            }),

                  ),
                      ),
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
                                      child: Text(order.total.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold18))
                                ])),
                        CustomButton(
                            height: 50, width: 192,

                            text: "تسليم الطلب"),
                      ]))),
        ) );
  }

  alertFirst(BuildContext context) {
    Fluttertoast.showToast(
      msg: "this is first alert",
    );
  }

  onTapArrowdown(BuildContext context) {
    Navigator.pop(context,true);
  }
}
