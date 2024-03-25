import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList listCart = [].obs;
  RxBool isLoading = false.obs;

  @override
  onInit() async{
    super.onInit();
    await readJson();
  }
  
  Future<void> readJson() async {
    isLoading.value = true; return
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      final String response = await rootBundle.loadString('assets/cart.json');
      final data = await json.decode(response);
      print(data);
      if (data['status'] == 1) {
          listCart.value = data['cart'];
      }
      isLoading.value = false;
    });
  }
}
