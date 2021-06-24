import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'features/home/controller/single_transaction_controller.dart';
import 'features/home/presentation/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final c = Get.put(SingleTransactionController());

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarBrightness: Brightness.dark,
    // ));
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () =>
            MaterialApp(
          debugShowCheckedModeBanner: false,
              title: 'Hub',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomePage(),
            )
    );
  }
}
