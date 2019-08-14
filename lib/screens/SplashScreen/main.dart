import 'dart:async';

import "package:flutter/material.dart";
import "package:ai4e_mobileapp/utils/CustomSP.dart";
import "package:ai4e_mobileapp/mobx/main.dart";
import "package:ai4e_mobileapp/models/User.dart";

import "dart:convert";

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkLogined() async {
    var userInfo = await CustomSP.getString("user");
    if (userInfo == null) {
      Navigator.pushReplacementNamed(context, "/auth");
    } else {
      var infoUser = await CustomSP.getString("user");
      user.login(User.fromJson(json.decode(infoUser)));
      Navigator.pushReplacementNamed(context, "/dashboard");
    }
  }

  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 2), () {
      checkLogined();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.9],
          colors: [
            Color(0xFFFC5C7D),
            Color(0xFF6A82FB),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 90.0),
      child: FlutterLogo(
        size: 100,
      ),
    );
  }
}
