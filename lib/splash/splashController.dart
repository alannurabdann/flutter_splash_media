import 'dart:io';
import 'package:flutter_getx_template/helpers/sharedPref.dart';
import 'package:get/get.dart';

import '../helpers/constants.dart';
import '../media/mediaScreen.dart';

class SplashController extends GetxController {
  SharedPref sp = Get.find();
  RxBool isFileExists = false.obs;
  RxString filePath = "".obs;
  RxBool isFetched = false.obs;

  @override
  void onReady() async {
    super.onReady();
    isFetched.value = false;
    String fileName = sp.getLocalPath + "/" + "${Constants.fileNameSplash}.jpg";
    print("Splash : $fileName");
    if (await File(fileName).exists()) {
      isFileExists.value = true;
      filePath.value = fileName;
    }
    isFetched.value = true;
    navigate();
  }

  Future navigate() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.off(() => MediaScreen());
    });
  }
}
