import "package:flutter/material.dart";
import "package:ai4e_mobileapp/screens/DashboardScreen/CardInfo.dart";

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
                    child: Text("Dashboard"),
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
