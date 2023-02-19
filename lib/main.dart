// ignore_for_file: unnecessary_new, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:medzonedelivery/pages/Log.dart';
import 'package:medzonedelivery/pages/orderlistpage.dart';
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
    // initUniqueIdentifierState();
    print("in the meddle");
   initUniqueIdentifierState();//
    startSplashScreenTimer();
    // calling startSplashScreenTimer method,to start the timer
  }

  startSplashScreenTimer() async {
    // Because we using Timer and it is a Future Object, we used async keyword
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationTologine);
    /*
     1-Create a variable type Duration, and set Duration to 5 seconds,
     2-Create a  Timer here, which takes two arguments, first duration,
     and callback which is in our case is navigationToNextPage which will be called after the duration {5 seconds here },
     Note: we have to import 'dart:async' so we can use Timer class
     */
  }

  void navigationTologine() {
    Get.to(Log());
  }

  Widget build(BuildContext context) {
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
                  height: getVerticalSize(168.00),
                  width: getHorizontalSize(238.00),
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
    String? identifier;
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
    });
  }

  int myRandomGenerator() {
    Random m = Random();
    return m.nextInt(10);
  }
}
