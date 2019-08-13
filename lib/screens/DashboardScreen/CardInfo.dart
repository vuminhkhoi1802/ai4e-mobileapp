import "package:flutter/material.dart";

Widget cardInfo(context) {
  return Stack(
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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.9],
            colors: [
              Color(0xFFDD5E89),
              Color(0xFF62B8FF),
            ],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 2,
              color: Colors.grey[500],
            ),
          ],
        ),
        height: 250,
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
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    )),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.stars, size: 40, color: Colors.white),
                        Text(
                          "000",
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "STREAK",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        padding: EdgeInsets.only(left: 12),
                        margin: EdgeInsets.only(top: 15),
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.2),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
