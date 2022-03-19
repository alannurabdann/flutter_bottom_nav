import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
 //LoginController controller = Get.put(LoginController());

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final Widget svg = SvgPicture.asset(
    'assets/logo_klik_igr.svg',
    semanticsLabel: 'Logo Klik IGR',
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: Colors.blue),
        Container(
          margin: EdgeInsets.only(top: 32.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            IconButton(
                icon: const Icon(CupertinoIcons.back,
                    color: Colors.white, size: 32),
                onPressed: () {
                  Get.back();
                }),
            Container(
                margin: EdgeInsets.only(left: 56), child: svg, width: 180),
          ]),
        ),
        Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(top: 130),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
                child: Column(children: [
              Text("Silahkan login terlebih dahulu", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 48),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.blue)),
                    hintText: 'Email Anda',
                    helperText: 'Masukkan email terdaftar di Klik Indogrosir',
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: Colors.blue.shade700,
                    ),
                  )),
              SizedBox(height: 36.0),
              TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.blue)),
                    hintText: 'Password',
                    helperText: 'Masukkan kata sandi',
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      color: Colors.blue.shade700,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        _toggle();
                      },
                    ),
                  )),
              SizedBox(height: 36.0),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Login"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                    ),
                    onPressed: () {},
                  )),
            ])))
      ],
    ));
  }

  static LoginController() {}
}
