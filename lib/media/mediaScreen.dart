import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mediaController.dart';

class MediaScreen extends StatelessWidget {
  MediaController mc = Get.put(MediaController());

  Widget imageBanner(String filename) {
    return Image.file(
      File(filename),
      height: 400,
      width: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Media Download"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              const SizedBox(height: 16),
              Obx(() => !mc.isFileDownloaded.value
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox()),
              const SizedBox(height: 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () async {
                        await mc.download(1);
                      },
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.5)),
                          padding: const EdgeInsets.all(8),
                          child:
                              const Icon(Icons.download, color: Colors.black),
                        ),
                        const SizedBox(height: 8),
                        const Text("Splash Desember")
                      ])),
                  const SizedBox(width: 56),
                  InkWell(
                      onTap: () async {
                        await mc.download(2);
                      },
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.withOpacity(0.5)),
                          padding: const EdgeInsets.all(8),
                          child:
                              const Icon(Icons.download, color: Colors.black),
                        ),
                        const SizedBox(height: 8),
                        const Text("Splash Februari")
                      ]))
                ],
              )
            ]));
  }
}
