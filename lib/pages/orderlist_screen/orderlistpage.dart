import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medzonedelivery/classes/DeliveryMan.dart';
import 'package:medzonedelivery/core/app_export.dart';
import 'package:medzonedelivery/pages/Auth/presentation/Login.dart';
import 'package:medzonedelivery/pages/orderdetails_screen/orderdetails_screen.dart';
import 'package:medzonedelivery/widgets/app_bar/appbar_image.dart';

import '../../classes/DioConnection.dart';
import '../../widgets/custom_button.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key, required this.deliveryMan});
  final DeliveryMan deliveryMan;
  @override
  State<OrderList> createState() => _OrderListState(deliveryMan);
}

class _OrderListState extends State<OrderList> {
  final DeliveryMan man;

  _OrderListState(this.man);

  final GlobalKey<AnimatedListState> key = GlobalKey();
// final Animation animation = AnimatedListState();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHieght = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                  appBar: AppBar(
                      backgroundColor: ColorConstant.whiteA700,
                      leadingWidth: 45,
                      bottom: TabBar(
                          labelPadding: EdgeInsets.symmetric(
                              horizontal: screenWidth * .2),
                          labelColor: ColorConstant.whiteA700,
                          unselectedLabelColor: ColorConstant.gray700,
                          isScrollable: true, //<-- Unselected text
                          indicator: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20), // Creates border
                              color: ColorConstant.medzonebackground),
                          tabs: [
                            Tab(
                              text: 'قيد الانجاز',
                            ),
                            Tab(text: ' تعذر الانجاز'),
                          ]),
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
                  body: TabBarView(children: [
                    Container(
                      //for first tab
                      height: getHorizontalSize(400),
                      color: ColorConstant.whiteA700,

                      child: Container(
                          child: FutureBuilder(
                              future: DioConnection.new().getData(man),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.data == null) {
                                  return Container(
                                    child: Center(
                                      child: Text("جاري التحميل ..."),
                                    ),
                                  );
                                } else {
                                  var items = snapshot.data;

                                  return ListView.builder(
                                      itemCount:
                                          items == null ? 0 : items.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          elevation: 10,
                                          child: InkWell(
                                              // When the user taps the button, show a snackbar.
                                              onTap: () {
                                                onTapGotoDetails(
                                                    context, items[index]);
                                              },
                                              child: Visibility(
                                                visible: _isShow(
                                                    items[index].status),
                                                child: Container(
                                                  padding: getPadding(
                                                    all: 15,
                                                  ),
                                                  decoration: AppDecoration
                                                      .outlineBluegray501
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: getPadding(
                                                          right: 8,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                bottom: 2,
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        items[index]
                                                                            .customer_full_name
                                                                            .toString(),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.right,
                                                                        style: AppStyle
                                                                            .txtInterSemiBold16,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            getPadding(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              35,
                                                                          bottom:
                                                                              2,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              items[index].code.toString(),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.right,
                                                                              style: AppStyle.txtInterSemiBold16,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        getPadding(
                                                                      top: 2,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      CustomImageView(
                                                                        svgPath:
                                                                            ImageConstant.imgLocation,
                                                                        height:
                                                                            getSize(
                                                                          15.00,
                                                                        ),
                                                                        width:
                                                                            getSize(
                                                                          15.00,
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
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 2,
                                                        ),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgCalendar15x15,
                                                              height: getSize(
                                                                12.00,
                                                              ),
                                                              width: getSize(
                                                                12.00,
                                                              ),
                                                            ),
                                                            Text(
                                                              items[index]
                                                                  .order_date
                                                                  .toString()
                                                                  .substring(
                                                                      0, 10),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtInterMedium12Gray700,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  getSize(30),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 5,
                                                              ),
                                                              child: Text(
                                                                items[index]
                                                                    .total
                                                                    .toString(),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    ColorConstant
                                                                        .green300,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  getHorizontalSize(
                                                                    3.00,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 5,
                                                              ),
                                                              child: Text(
                                                                items[index]
                                                                    .status
                                                                    .toString(),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
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
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            CustomButton(
                                                              height: 50,
                                                              width: 150,
                                                              text:
                                                                  "تم التسليم",
                                                              onTap: () =>
                                                                  onTapDeliveryState(
                                                                      context,
                                                                      items[index]
                                                                          .id,
                                                                      1),
                                                            ),
                                                            CustomButton(
                                                              height: 50,
                                                              width: 150,
                                                              text:
                                                                  "تعذر التسليم ",
                                                              onTap: () =>
                                                                  onTapDeliveryState(
                                                                      context,
                                                                      items[index]
                                                                          .id,
                                                                      0),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        );
                                      });
                                }
                              })),
                    ),
                    Container(
                      //for first tab
                      height: getHorizontalSize(400),
                      color: ColorConstant.whiteA700,

                      child: Container(
                          child: FutureBuilder(
                              future: DioConnection.new().getData(man),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
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
                                      itemCount:
                                          items == null ? 0 : items.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          elevation: 8,
                                          child: InkWell(
                                              // When the user taps the button, show a snackbar.
                                              onTap: () {
                                                onTapGotoDetails(
                                                    context, items[index]);
                                              },
                                              child: Visibility(
                                                visible: _isCouldNot(
                                                    items[index]
                                                        .status
                                                        .toString()),
                                                child: Container(
                                                  padding: getPadding(
                                                    all: 15,
                                                  ),
                                                  decoration: AppDecoration
                                                      .outlineBluegray501
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: getPadding(
                                                          right: 8,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                bottom: 2,
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        items[index]
                                                                            .customer_full_name
                                                                            .toString(),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.right,
                                                                        style: AppStyle
                                                                            .txtInterSemiBold16,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            getPadding(
                                                                          right:
                                                                              100,
                                                                          bottom:
                                                                              2,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              items[index].code.toString(),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.right,
                                                                              style: AppStyle.txtInterSemiBold16,
                                                                            ),
                                                                            Text(
                                                                              "   ",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.right,
                                                                              style: AppStyle.txtInterSemiBold18,
                                                                            ),
                                                                            Text(
                                                                              "  ",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.right,
                                                                              style: AppStyle.txtInterSemiBold18,
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
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 1,
                                                        ),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
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
                                                              padding:
                                                                  getPadding(
                                                                left: 5,
                                                              ),
                                                              child: Text(
                                                                items[index]
                                                                    .order_date
                                                                    .toString()
                                                                    .substring(
                                                                        0, 10),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtInterMedium12Gray700,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  getSize(30),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 5,
                                                              ),
                                                              child: Text(
                                                                items[index]
                                                                    .total
                                                                    .toString(),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    ColorConstant
                                                                        .green300,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  getHorizontalSize(
                                                                    3.00,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 5,
                                                              ),
                                                              child: Text(
                                                                items[index]
                                                                    .status
                                                                    .toString(),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
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
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Visibility(
                                                              visible: true,
                                                              child:
                                                                  CustomButton(
                                                                height: 50,
                                                                width: 150,
                                                                text:
                                                                    "تم التسليم",
                                                                onTap: () =>
                                                                    onTapDeliveryState(
                                                                        context,
                                                                        items[index]
                                                                            .id,
                                                                        1),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        );
                                      });
                                }
                              })),
                    ),
                  ]))),
        ));
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
          deliveryMan: man,
        ));
  }

  onTapDeliveryState(BuildContext context, int id, int status) async {
    bool result =
        await DioConnection.new().updateState(id, status, man) as bool;
    print("result is ");
    print(result);
    if (result) {
      if (status == 1) alertDelivered(context);
      if (status == 0) alerNotDileverd(context);

      // key.currentState!.removeItem(context, (context, animation) => null)
    } else
      alertErorre(context);
    setState(() {});
  }

  alerNotDileverd(BuildContext context) {
    Fluttertoast.showToast(
        msg: "تعذر التسليم ", backgroundColor: ColorConstant.medzonebackground);
  }

  alertDelivered(BuildContext context) {
    Fluttertoast.showToast(
        msg: "تم التسليم بنجاح",
        backgroundColor: ColorConstant.medzonebackground);
  }

  alertErorre(BuildContext context) {
    Fluttertoast.showToast(msg: "حاول مجددا ");
  }

  onTapArrowdown(BuildContext context) {
    Get.to(() => Login());
  }

  bool _isShow(String string) {
    bool b = false;
    print(string);
    if (string == "تم الدفع") b = false;
    if (string == "تعذر التوصيل")
      b = false;
    else
      b = true;
    return b;
  }

  bool _isCouldNot(String string) {
    if (string == 'تعذر التوصيل')
      return true;
    else
      return false;
  }
}
