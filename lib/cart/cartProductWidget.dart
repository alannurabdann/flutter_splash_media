import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/currencyFormat.dart';

class CartProductWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  CartProductWidget({Key? key, required this.data}) : super(key: key);

  double width_1 = 76;
  double width_2 = 150;

  @override
  Widget build(BuildContext context) {
    double w = width_1;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  data['url'].toString(),
                  height: 96,
                  width: 96,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data['kode_produk']),
                            Text("${data['unit']} / isi ${data['frac']}")
                          ]),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data['name'],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "${data['qty']} x ${CurrencyFormat.convertToIdr(data['harga_satuan'], 0)}"),
                            Text(CurrencyFormat.convertToIdr(
                                data['qty'] * data['harga_satuan'], 0))
                          ]),
                      LimitedBox(
              maxHeight: 500,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data['potongan'].length,
                itemBuilder: (BuildContext context, int index) {
                  var value = data['potongan'][index];
                  return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(children: [
                        Text("${value['jenis'].toString()} : "),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("${value['qty'].toString()} x "),
                        Text(CurrencyFormat.convertToIdr(value['nominal'], 0)),
                        Expanded(
                          child: Text(
                            "- ${CurrencyFormat.convertToIdr(value['subtotal'], 0)}",
                            textAlign: TextAlign.end,
                          ),
                        )
                      ]));
                },
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Divider(
                  thickness: 1.5,
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                "Subtotal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                CurrencyFormat.convertToIdr(data['subtotal'], 0),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ]),
            const SizedBox(
              height: 4,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Harga per pcs"),
              Text(CurrencyFormat.convertToIdr(data['harga_per_pcs'], 0))
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Hapus",
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(width: w),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        icon: const Icon(
                          CupertinoIcons.minus_circle_fill,
                          size: 32,
                        ),
                        color: Colors.red,
                        onPressed: () {}),
                  ),
                  SizedBox(
                      child: Text(
                    data['qty'].toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        icon: const Icon(
                          CupertinoIcons.plus_circle_fill,
                          size: 32,
                        ),
                        color: Colors.blue,
                        onPressed: () {}),
                  ),
                ])
                    ]))
              ],
            ),
            
          ],
        ));
  }
}
