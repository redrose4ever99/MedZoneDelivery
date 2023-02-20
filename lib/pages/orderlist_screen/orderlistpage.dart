import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medzonedelivery/classes/DeliveryMan.dart';
import 'package:medzonedelivery/core/app_export.dart';
import 'package:medzonedelivery/pages/orderdetails_screen/orderdetails_screen.dart';
import 'package:medzonedelivery/widgets/app_bar/appbar_image.dart';
import 'package:medzonedelivery/widgets/app_bar/custom_app_bar.dart';
import '../../classes/DioConnection.dart';
import '../../widgets/custom_button.dart';

// ignore_for_file: must_be_immutable

class OrderList extends StatefulWidget {
  const OrderList({super.key, required this.deliveryMan});
  final DeliveryMan deliveryMan;
  @override
  State<OrderList> createState() => _OrderListState(deliveryMan);
}

class _OrderListState extends State<OrderList> {
  final DeliveryMan man;

  _OrderListState(this.man);
  @override
  Widget build(BuildContext context) {
    return Directionality(
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
          body: Container(
              child: FutureBuilder(
                  future: DioConnection.new().getData(this.man),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text("جاري التحميل ..."),
                        ),
                      );
                    } else {
                      var items = snapshot.data;
                      print(items[0].code);
                      return ListView.builder(
                          itemCount: items == null ? 0 : items.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return InkWell(
                                // When the user taps the button, show a snackbar.
                                onTap: () {
                                  onTapGotoDetails(context, items[index]);
                                },
                                child: Container(
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
                                                      Text(
                                                        "الدكتور ....",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: AppStyle
                                                            .txtInterSemiBold18,
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          right: 8,
                                                          bottom: 2,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              items[index]
                                                                  .code
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: AppStyle
                                                                  .txtInterSemiBold18,
                                                            ),
                                                            Text(
                                                              "       ",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: AppStyle
                                                                  .txtInterSemiBold18,
                                                            ),
                                                            Text(
                                                              "جرمانا الجناين",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: AppStyle
                                                                  .txtInterSemiBold18,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      top: 2,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgLocation,
                                                        height: getSize(
                                                          15.00,
                                                        ),
                                                        width: getSize(
                                                          15.00,
                                                        ),
                                                      ),
                                                      Text(
                                                        "جرمانا الجناين",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: AppStyle
                                                            .txtInterMedium12Gray700,
                                                      ),
                                                    ],
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgCalendar15x15,
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
                                                style: AppStyle
                                                    .txtInterMedium12Gray700,
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 5,
                                              ),
                                              child: Text(
                                                items[index].total.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterMedium12Gray700,
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
                                                borderRadius:
                                                    BorderRadius.circular(
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
                                                items[index].status.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterMedium12Gray700,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomButton(
                                              height: 50,
                                              width: 150,
                                              text: "تم التسليم",
                                              onTap: () => onTapDeliveryState(
                                                  context, items[index].id, 1),
                                            ),
                                            CustomButton(
                                              height: 50,
                                              width: 150,
                                              text: "تعذر التسليم ",
                                              onTap: () => onTapDeliveryState(
                                                  context, items[index].id, 0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          });
                    }
                  }))),
    );
  }

  alert(BuildContext context, String str) {
    Fluttertoast.showToast(
      msg: str,
      backgroundColor: ColorConstant.medzonebackground,
    );
  }

  void onTapGotoDetails(BuildContext context, item) {
    Get.to(() => OrderdetailsScreen(
          order: item,
        ));
  }

  onTapDeliveryState(BuildContext context, int id, int status) {
    DioConnection.new().updateState(id, status, man);
  }

  onTapArrowdown(BuildContext context) {}

  // void onTapGotoDetails(BuildContext context,List<Orders>) {
  // Get.to(() => OrderdetailsScreen());
  //}
}
