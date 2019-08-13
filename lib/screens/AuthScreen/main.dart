import "package:flutter/material.dart";
import "handleAuth/main.dart";

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: handleAuthScreen());
  }
}
