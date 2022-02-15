import 'package:flutter/material.dart';
import 'package:getx_app/models/products.dart';

class child_products extends StatelessWidget {
  late final products p;
  child_products(this.p);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        p.selected == true
            ? Icon(Icons.radio_button_checked)
            : Icon(Icons.radio_button_unchecked),
        SizedBox(
          width: 8.0,
        ),
        p.hargaPromo == "0"
            ? Expanded(
                child: Text.rich(
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
              ))
            : Expanded(
                child: Text.rich(
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
                    new TextSpan(text: " "),
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
              ))
      ],
    );
  }
}
