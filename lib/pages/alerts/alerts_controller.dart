import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/products.dart';
import 'package:getx_app/widgets/child_products.dart';
import 'package:logger/logger.dart';

class AlertsController extends GetxController {
  var listData = List<products>.from([]).obs;
  var logger = Logger();

  @override
  void onInit() async {
    initialItem();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  void initialItem() {
    this.listData.clear();

    /** 
     * satuan 1 : 3500/pcs min beli 1
     * satuan 2 : 3300/pcs min beli 5
     * satuan 0 : 3300/pcs min beli 1 ctn
     */
    this.listData.add(new products("0000001", "Rp3.500", "0", "Rp3.500", true));
    this.listData.add(
        new products("0000002", "Rp17.500", "Rp16.500", "Rp3.300", false));
    this.listData.add(
        new products("0000000", "Rp42.000", "Rp39.600", "Rp3.300", false));

    update();
  }

  void showDialogItem(BuildContext context) {
    var qty = 1.obs();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'BANGO KECAP MANIS REFILL 10050/10034 PCH 550/520mL',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            // actions: <Widget>[
            //   ElevatedButton(
            //     child: const Text('Tutup'),
            //     onPressed: () {
            //       Get.back();
            //     },
            //   ),
            // ],
            content: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Harga Termurah : Rp3.300"),
                    SizedBox(height: 8.0),
                    Text("Isi Beli : 12"),
                    SizedBox(height: 8.0),
                    Text("Minimum Beli : 5"),
                    SizedBox(height: 16.0),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.4,
                      ),
                      child: Obx(
                        () => ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey,
                          ),
                          shrinkWrap: true,
                          itemCount: this.listData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return new InkWell(
                              onTap: () {
                                this.listData.forEach(
                                    (element) => element.selected = false);
                                this.listData[index].selected = true;
                                logger.e(this.listData[index].kodePLU! +
                                    " is selected");
                                listData.refresh();
                                this.update();
                              },
                              child: child_products(this.listData[index]),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    Row(children: <Widget>[
                      IconButton(
                          icon: const Icon(CupertinoIcons.minus_circle_fill,
                              color: Colors.red, size: 32),
                          onPressed: () {}),
                      SizedBox(width: 8),
                      Text(qty.toString()),
                      SizedBox(width: 8),
                      IconButton(
                          icon: const Icon(CupertinoIcons.plus_circle_fill,
                              color: Colors.blue, size: 32),
                          onPressed: () {}),
                      SizedBox(width: 16),
                      Expanded(
                          child: ElevatedButton(
                              child: Text("Beli"),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.orange)),
                              onPressed: () {})),
                    ])
                  ],
                ),
              ),
            ),
          );
        });
  }

  void buyItem(BuildContext context) {
    this.listData.forEach((element) {
      if (element.selected == true) {
        final snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text(element.kodePLU! + " is selected!"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
