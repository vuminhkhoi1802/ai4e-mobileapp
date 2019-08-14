import 'dart:convert';

import "package:flutter/material.dart";
import "Loader.dart";
import "package:ai4e_mobileapp/utils/CustomSP.dart";
import "package:ai4e_mobileapp/models/User.dart";
import "package:ai4e_mobileapp/mobx/main.dart" as MobX;

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      var userInfo =
          User(id: 1, name: "Ng H.Minh", level: 1, score: 0, streak: 0);

      CustomSP.saveString("user", json.encode(userInfo.toJson()));
      MobX.user.login(userInfo);
      Navigator.of(context).pushNamedAndRemoveUntil(
          "/dashboard", (Route<dynamic> route) => false);
    });
    return Scaffold(
      body: Center(
        child: Loader(
          dotRadius: 10.0,
          radius: 50.0,
        ),
      ),
    );
  }
}
