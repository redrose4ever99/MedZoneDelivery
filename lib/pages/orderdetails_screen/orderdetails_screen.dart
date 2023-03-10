import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medzonedelivery/classes/DeliveryMan.dart';
import 'package:medzonedelivery/classes/DioConnection.dart';
import 'package:medzonedelivery/classes/Order.dart';
import 'package:flutter/material.dart';
import 'package:medzonedelivery/core/app_export.dart';

import 'package:medzonedelivery/pages/orderlist_screen/orderlistpage.dart';
import 'package:medzonedelivery/widgets/app_bar/appbar_image.dart';
import 'package:medzonedelivery/widgets/app_bar/custom_app_bar.dart';
import 'package:medzonedelivery/widgets/custom_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderdetailsScreen extends StatelessWidget {
  const OrderdetailsScreen(
      {super.key, required this.order, required this.deliveryMan});
  final Order order;
  final DeliveryMan deliveryMan;

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
              appBar: CustomAppBar(
                  height: screenHieght / 2,
                  leadingWidth: 45,
                  leading: Container(
                    height: getSize(24.00),
                    width: getSize(24.00),
                    padding: getPadding(
                      all: 2,
                    ),
                    child: Align(
                      alignment: Alignment(1, -1),
                      child: AppbarImage(
                          height: getSize(24.00),
                          width: getSize(24.00),
                          svgPath: ImageConstant.imgArrowdownGray700,
                          margin: getMargin(right: 21, top: 2, bottom: 16),
                          onTap: () => onTapArrowdown(context)),
                    ),
                  ),
                  centerTitle: true,
                  title: Container(
                    margin: getMargin(
                      all: 10,
                    ),
                    child: Column(children: [
                      Center(
                        child: Text("???????????? ??????????",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterSemiBold16),
                      ),
                      const SizedBox(
                        height: 8, // <-- SEE HERE
                      ),
                      Row(
                        children: [
                          Text(order.customer_full_name.toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold16),
                          const SizedBox(
                            width: 20, // <-- SEE HERE
                          ),
                          Container(
                            child: Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Text(order.status.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMediumRed),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                          decoration: InputDecoration.collapsed(
                              hintText:
                                  " ????????????:   ${order.customer_business_name}"),
                          keyboardType: TextInputType.multiline,
                          cursorColor: ColorConstant.whiteA700,
                          minLines: 1, // <-- SEE HERE
                          maxLines: 5,
                          style: AppStyle.txtInterSemi2Bold // <-- SEE HERE
                          ),
                      Row(
                        children: [
                          Container(
                            width: width / 2,
                            child: Row(
                              children: [
                                Text("????????????: ",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterSemiBold),
                                Text(order.customer_mobile ?? "?????? ????????",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterSemiBold),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("????????: ",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold),
                              Text(order.customer_land_phone ?? "?????? ????????",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold),
                            ],
                          ),
                        ],
                      ),
                      TextField(
                          decoration: InputDecoration.collapsed(
                              hintText:
                                  " ??????????:   ${order.customer_area}   ????????:  ${order.customer_sector}"),
                          keyboardType: TextInputType.multiline,
                          cursorColor: ColorConstant.whiteA700,
                          minLines: 1, // <-- SEE HERE
                          maxLines: 5,
                          style: AppStyle.txtInterSemi2Bold // <-- SEE HERE
                          ),
                      TextField(
                        decoration: InputDecoration.collapsed(
                            hintText:
                                "${order.customer_street}   ????????:  ${order.customer_marker}"),
                        keyboardType: TextInputType.multiline,
                        cursorColor: ColorConstant.whiteA700,
                        style: AppStyle.txtInterSemi2Bold,
                        minLines: 1, // <-- SEE HERE
                        maxLines: 5, // <-- SEE HERE
                      ),
                      TextField(
                        decoration: InputDecoration.collapsed(
                            hintText:
                                " ???????????? ??????????????:   ${order.customer_details_address}"),
                        keyboardType: TextInputType.multiline,
                        cursorColor: ColorConstant.whiteA700,
                        style: AppStyle.txtInterSemi2Bold,
                        minLines: 1, // <-- SEE HERE
                        maxLines: 5, // <-- SEE HERE
                      ),
                      TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: " ???????????? :   ${order.customer_notes}"),
                        keyboardType: TextInputType.multiline,
                        cursorColor: ColorConstant.whiteA700,
                        minLines: 1, // <-- SEE HERE
                        maxLines: 5,
                        style: AppStyle.txtInterSemi2Bold,
                        onChanged: (text) {
                          print(text);
                        }, // <-- SEE HERE
                      ),
                    ]),
                  )),
              body: Card(
                color: ColorConstant.whiteA700,
                child: Container(
                  child: FutureBuilder(
                      future: order.getProductList(order),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                            child: const Text("???????? ?????????????? ..."),
                          );
                        } else {
                          var items = snapshot.data;

                          return ListView.builder(
                              itemCount: items == null ? 0 : items.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 5,
                                  child: Container(
                                    padding: getPadding(
                                      all: 13,
                                    ),
                                    decoration: AppDecoration.outlineBluegray501
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                          width: width / 4,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "?????????? ",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style: AppStyle
                                                                    .txtInterSemiBold16,
                                                              ),
                                                              Text(
                                                                items[index]
                                                                        .offer ??
                                                                    "",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style: AppStyle
                                                                    .txtInterSemiBold16,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width / 4,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "???????????? ",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style: AppStyle
                                                                    .txtInterSemiBold16,
                                                              ),
                                                              Text(
                                                                items[index]
                                                                        .amount ??
                                                                    "",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style: AppStyle
                                                                    .txtInterSemiBold16,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: width / 4,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "?????????? ",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style: AppStyle
                                                                    .txtInterSemiBold16,
                                                              ),
                                                              Text(
                                                                items[index]
                                                                        .price ??
                                                                    "",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style: AppStyle
                                                                    .txtInterSemiBold16,
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
                                  Text("????????????????",
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
                        Visibility(
                            visible: _isShow(),
                            child: CustomButton(
                              height: getHorizontalSize(50),
                              width: getVerticalSize(120),
                              text: "?????????? ??????????",
                              onTap: () =>
                                  onTapDeliveryState(context, order.id ?? 0, 1),
                            )),
                      ]))),
        ));
  }

  alertFirst(BuildContext context) {
    Fluttertoast.showToast(
      msg: "this is first alert",
    );
  }

  bool _isShow() {
    if (order.status.toString() == '???? ??????????')
      return false;
    else
      return true;
  }

  onTapArrowdown(BuildContext context) {
    Get.to(() => OrderList(
          deliveryMan: deliveryMan,
        ));
  }

  onTapDeliveryState(BuildContext context, int id, int status) async {
    bool result =
        await DioConnection.new().updateState(id, status, deliveryMan) as bool;

    if (result) {
      Fluttertoast.showToast(
          msg: '?????? ?????????????? ??????????',
          backgroundColor: ColorConstant.medzonebackground);

      Get.to(() => OrderList(
            deliveryMan: deliveryMan,
          ));
    } else
      Fluttertoast.showToast(
          msg: '???????? ??????????????',
          backgroundColor: ColorConstant.medzonebackground);
  }

  alertstatus(BuildContext context, status) {
    String stas = '';
    if (status == 1) stas = '???? ??????????????';
    if (status == 0) stas = '???????? ??????????????';
    Fluttertoast.showToast(msg: " ???? ?????????? ???????????? ?????? $stas");
  }

  alertErorre(BuildContext context) {
    Fluttertoast.showToast(msg: "???????? ?????????? ");
  }
}
