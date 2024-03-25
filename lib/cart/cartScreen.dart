import 'package:flutter/material.dart';
import 'package:flutter_getx_template/cart/cartController.dart';
import 'package:flutter_getx_template/cart/cartProductWidget.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Keranjang"),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.listCart.isEmpty
                  ? const Center(child: Text("Kosong!"))
                  : ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                      ),
                      itemCount: controller.listCart.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CartProductWidget(
                            data: controller.listCart[index]);
                      },
                    ),
        ));
  }
}
