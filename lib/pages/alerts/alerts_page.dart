import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/products.dart';
import 'package:getx_app/pages/alerts/alerts_controller.dart';
import 'package:getx_app/pages/others/add_alert_page.dart';
import 'package:getx_app/widgets/child_products.dart';

AlertsController controller = Get.put(AlertsController());

class AlertsPage extends StatefulWidget {
  @override
  CustomPicks createState() => new CustomPicks();
}

class CustomPicks extends State<AlertsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                    ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.listData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new InkWell(
                        onTap: () {
                          setState(() {
                            controller.listData
                                .forEach((element) => element.selected = false);
                            controller.listData[index].selected = true;
                          });
                        },
                        child: child_products(controller.listData[index]),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: Text("Detail"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.orange),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            controller.showDialogItem(context);
                          },
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextButton(
                          child: Text("Beli"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            controller.buyItem(context);
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    child: Text("Tambah Counter"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Get.to(AddAlertPage());
                    },
                  ),
                ])));
  }

  pluPick({products? p}) {
    return Row(
      children: [
        p!.selected == true
            ? Icon(Icons.radio_button_checked)
            : Icon(Icons.radio_button_unchecked),
        SizedBox(
          width: 8.0,
        ),
        p.hargaPromo == "0"
            ? Text.rich(
                TextSpan(
                  text: p.kodePLU! + " - ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    new TextSpan(
                      text: p.hargaNormal,
                    ),
                    new TextSpan(
                      text: " (" + p.hargaSatuan! + " per pcs)",
                    ),
                  ],
                ),
              )
            : Text.rich(
                TextSpan(
                  text: p.kodePLU! + " - ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    new TextSpan(
                      text: p.hargaNormal,
                      style: new TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    new TextSpan(
                        text: p.hargaPromo,
                        style: new TextStyle(
                          color: Colors.red,
                        )),
                    new TextSpan(
                        text: " (" + p.hargaSatuan! + " per pcs)",
                        style: new TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              )
      ],
    );
  }
}
