import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splashController.dart';

class SplashScreen extends StatelessWidget {
  SplashController s = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => s.isFetched.value
            ? s.isFileExists.value
                ? SizedBox(
                    width: double.infinity,
                    child:
                        Image.file(File(s.filePath.value), fit: BoxFit.cover))
                : const Center(
                    child: Text("Welcome",
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.w800)),
                  )
            : const CircularProgressIndicator()));
  }
}
