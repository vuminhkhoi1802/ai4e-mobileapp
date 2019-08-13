import "package:flutter/material.dart";
import "CustomTextField.dart";
import "package:ai4e_mobileapp/widgets/fullWidthBtn/main.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Color(0xff77777a),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Enter your detail'.toUpperCase(),
            style: TextStyle(color: Color(0xff77777a)),
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: <Widget>[
                  customTextField(
                    "Username or email",
                    BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    paddingTop: 20.0,
                  ),
                  customTextField(
                    "Password",
                    BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    secure: true,
                  ),
                  fullWidthBtn(Color(0xff20BF55), Colors.white, "Login", () {},
                      paddingTop: 20.0),
                ],
              )),
        ));
  }
}
