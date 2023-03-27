import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tvlegaleadm/pages.dart';

import 'app_config_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      //   DevicePreview.appBuilder,
      return GetMaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
              data: data.copyWith(textScaleFactor: 1), child: child!);
        },
        debugShowCheckedModeBanner: false,
        title: 'Tv Legale ADM',
        initialBinding: AppConfigInitBindings(),
        // defaultTransition: Transition.rightToLeftWithFade,
        color: Colors.white,
        initialRoute: '/TvList',
        getPages: pages,
      );
    });
  }
}
