import 'dart:io';
import 'package:flutter/services.dart' as imageCache;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../helpers/constants.dart';

class MediaController extends GetxController {
  RxString localPath = "".obs;
  RxBool permissionReady = false.obs;
  late TargetPlatform? platform;
  RxBool isFileDownloaded = true.obs;
  RxString fileLocation = "".obs;

  String file1 =
      "https://comprof.s3.ap-southeast-1.amazonaws.com/tmp/GEMERLAP+POIN+IGR+2+(SPLASH+SCREEN+KLIK).jpg";
  String file2 =
      "https://comprof.s3.ap-southeast-1.amazonaws.com/tmp/SS+HARBOLNAS+2.2.png";

  @override
  void onInit() async {
    super.onInit();
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }

    askPermission();
    //permissionReady.value = await checkPermission();
  }

  Future askPermission() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.storage, Permission.mediaLibrary].request();
    if (statuses[Permission.storage] == statuses[Permission.mediaLibrary]) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> prepareSaveDir() async {
    localPath.value = (await findLocalPath())!;

    print(localPath.value);
    final savedDir = Directory(localPath.value);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return Constants.localFilePath;
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }

  Future download(int index) async {
    await prepareSaveDir();
    isFileDownloaded.value = false;

    String url = index == 1 ? file1 : file2;
    String title = index == 1 ? "Splash Desember" : "Splash Februari";
    print("Download : $url");

    String fileName = localPath + "/" + "${Constants.fileNameSplash}.jpg";

    //print("Delete File : ");
    //print(await File(fileName).delete());
    //ImageCache().clear();
    print("Downloading");
    try {
      await Dio().download(url, fileName);
      print("Download Completed.");
      isFileDownloaded.value = await File(fileName).exists();
      fileLocation.value = fileName;
      Get.snackbar("Horrray", "Download $title Complete",
          backgroundColor: Colors.amberAccent);
    } catch (e) {
      print("Download Failed.\n\n" + e.toString());
    }
  }
}
