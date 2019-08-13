import "package:flutter/material.dart";

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
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.white,
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          spreadRadius: 2,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                                color: Color(0xFF2F297A)),
                            child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Guest - Level 19",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Container(
                                child: Text(
                              "000",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.black,
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
