import "package:flutter/material.dart";
import "package:ai4e_mobileapp/screens/AuthScreen/handleAuth/Register/selectSkill.dart";

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.9],
                colors: [
                  Color(0xFFDD5E89),
                  Color(0xFF62B8FF),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                    flex: 7,
                    child: Column(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "I already have an account",
                                style: TextStyle(
                                    fontSize: 19, color: Color(0xFFFAFAFA)),
                              ),
                            )),
                        Spacer(
                          flex: 1,
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: ListTile(
                                title: Text("Hello",
                                    style: TextStyle(
                                        fontSize: 40.0, color: Colors.white)),
                                subtitle: Text("You finaly found us",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white)),
                              ),
                            ))
                      ],
                    )),
                Expanded(
                  flex: 8,
                  child: Container(
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 2,
                            color: Colors.grey[500],
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                "Select your skill",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              )),
                          Column(
                            children: <Widget>[
                              selectSkill(
                                "None",
                                "1 - 18",
                                "Vocabulary size: 0 - 500 words",
                              ),
                              Divider(
                                height: 0,
                              ),
                              selectSkill(
                                "Beginner",
                                "19 - 37",
                                "Vocabulary size: 500 - 1,000 words",
                              ),
                              Divider(
                                height: 0,
                              ),
                              selectSkill(
                                "Intermediate",
                                "38 - 72",
                                "Vocabulary size: 1,000 - 5,000 words",
                              ),
                              Divider(
                                height: 0,
                              ),
                              selectSkill(
                                "Advanced",
                                "73 - 96",
                                "Vocabulary size: > 5,000 words",
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            )));
  }
}
