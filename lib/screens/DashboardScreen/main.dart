import "package:flutter/material.dart";
import "package:ai4e_mobileapp/screens/DashboardScreen/CardInfo.dart";
import "package:ai4e_mobileapp/screens/DashboardScreen/selectOption.dart";

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text("Monday August 12",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        )),
                  ),
                )),
            Expanded(
              flex: 5,
              child: cardInfo(context),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      selectOption(
                        Colors.purple,
                        Icons.book,
                        "Course",
                        "Let's get started learning",
                      ),
                      selectOption(Color.fromRGBO(255, 255, 255, 0.2),
                          Icons.face, "Assistant", "I'm here to help you!",
                          colorIcon: Colors.purple),
                      selectOption(Color.fromRGBO(245, 166, 35, 0.4),
                          Icons.email, "Submit Feedback", "Let us know what you think of the app",
                          colorIcon: Color(0xFFf5a623 ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
