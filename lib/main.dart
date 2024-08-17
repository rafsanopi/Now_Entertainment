
import 'package:blog_app/core/route/app_routes.dart';
import 'package:blog_app/utils/device_utils.dart';
import 'package:blog_app/utils/landsScape.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'core/dependancy/depandency.dart';


///global object for accessing device size
late Size mq;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection di=DependencyInjection();
  di.dependencies();
  DeviceUtil.lockDevicePortrait();

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("c5d498da-02cb-4b13-8fb9-ad58f3e6fe10");
  OneSignal.Notifications.requestPermission(true);

  runApp(const MyApp());
 /* runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Blog App',
          initialRoute: AppRoutes.splashScreen,
          navigatorKey: Get.key,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}

