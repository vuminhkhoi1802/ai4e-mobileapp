import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 4,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
              ),
            )),
        body: Center(
          child: RaisedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/loading"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              padding: EdgeInsets.only(left: 20),
              color: const Color(0xFFFFFFFF),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.asset(
                    'assets/google_button.jpg',
                    height: 30.0,
                  ),
                  new Container(
                      padding: EdgeInsets.all(20),
                      child: new Text(
                        "Sign in with Google",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )),
                ],
              )),
        ));
  }
}
