import 'dart:async';
import 'dart:math';
//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';

import 'package:medzonedelivery/pages/Auth/presentation/Login.dart';

import 'package:unique_identifier/unique_identifier.dart';
import 'package:medzonedelivery/widgets/custom_image_view.dart';

import 'core/utils/color_constant.dart';
import 'core/utils/image_constant.dart';
import 'core/utils/size_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'MedZone Delevary',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? identifier;
  @override
  Widget buildin(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 100),
              CircleAvatar(
                radius: 70,
                backgroundColor: Color.fromARGB(255, 19, 185, 161),
              ),
              SizedBox(height: 50),
              CircularProgressIndicator(
                backgroundColor: Colors.black,
              )
            ],
          ),
        ));
  }

  String _identifier = 'Unknown';
  void initState() {
    // TODO: implement initState
    super.initState();
    initUniqueIdentifierState();
    print("in the meddle");
    startSplashScreenTimer();
  }

  startSplashScreenTimer() async {
    // Because we using Timer and it is a Future Object, we used async keyword
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationTologine);
  }

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
          body: Container(
            width: size.width,
            padding: getPadding(left: 17, top: 15, right: 17, bottom: 300),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              CustomImageView(
                  imagePath: ImageConstant.medzone,
                  height: screenHieght * 0.2,
                  width: screenWidth * 0.9,
                  margin: getMargin(top: 60)),
              CircularProgressIndicator(
                color: ColorConstant.medzonebackground,
                backgroundColor: Colors.white70,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> initUniqueIdentifierState() async {
    try {
      identifier = await UniqueIdentifier.serial;
      print('this is identifier');
      print(identifier);
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }

    if (!mounted) return;

    setState(() {
      _identifier = identifier!;
      Fluttertoast.showToast(
        msg: 'the device identifier is $_identifier',
      );
    });
  }

  int myRandomGenerator() {
    Random m = Random();
    return m.nextInt(10);
  }

  void navigationTologine() {
    //TabScreen
    // Get.to(() => TabScreen());
    Get.to(() => Login());
  }
}
