import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'helpers/appPages.dart';
import 'helpers/appRoutes.dart';
import 'helpers/sharedPref.dart';

void main() async {
  //await initializeDateFormatting('id_ID', 'en_EN').then((_) => runApp(MyApp()));
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPref sp = Get.put(SharedPref(), permanent: true);
  @override
  Widget build(BuildContext context) {
    print("MAIN : " + sp.getLocalPath.toString());
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      title: 'Media Splash',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,
    );
  }
}
