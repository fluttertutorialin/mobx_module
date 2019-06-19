import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx_module/constants/strings.dart';
import 'package:mobx_module/ui/pages/login/login_page.dart';
import 'package:mobx_module/ui/widgets/sign_up_background.dart';

class SplashPage extends StatefulWidget {
  @override
  createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Duration five;
  Timer t2;
  String routeName;

  @override
  void initState() {
    super.initState();
    five = const Duration(seconds: 3);
    t2 = new Timer(five, () {
      getCredential();
    });
  }

  @override
  void dispose() {
    if (this.mounted)
    super.dispose();
    t2.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SignUpBackground(
            showIcon: true,
          ),
          Container(
              height: double.infinity,
              width: double.infinity,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: new Text(
                      Strings.appName,
                      style: new TextStyle(color: Colors.orange, fontSize: 40),
                    ),
                  ),
                ],
              )),
        ],
      ),
      bottomNavigationBar: new Container(
          width: MediaQuery.of(context).size.width, child: companyName()),
    );
  }

  companyName() => Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Text('Release: 19-02-2019',
            style: TextStyle( color: Colors.black45,
                fontSize: 13.0,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );

  getCredential() async {
   Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => new LoginPage()));
    }
}
