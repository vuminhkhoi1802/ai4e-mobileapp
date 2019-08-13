import "package:flutter/material.dart";

Widget selectSkill(nameCourse, level, description, {active = false}) {
  return Container(
    decoration: active
        ? BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.9],
              colors: [
                Color(0xFFDD5E89),
                Color(0xFF62B8FF),
              ],
            ),
          )
        : BoxDecoration(),
    child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {},
            // onPressed: () {},
            child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                    child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: new Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        nameCourse + " ",
                        style: TextStyle(
                          color: active ? Colors.white : Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text("(Level $level)",
                          style: TextStyle(
                            color: active ? Colors.white : Colors.grey[600],
                          ))
                    ],
                  ),
                  subtitle: Text(
                    description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: active ? Colors.white : Colors.grey[600],
                    ),
                  ),
                ))))),
  );
}
