import "package:flutter/material.dart";
import "Loader.dart";

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
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
