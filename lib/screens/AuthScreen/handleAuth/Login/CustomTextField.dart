import "package:flutter/material.dart";

Widget customTextField(text, BorderRadius borderRadius,
    {secure = false, paddingTop = 0}) {
  return Padding(
      padding: EdgeInsets.only(top: paddingTop.toDouble()),
      child: TextField(
          obscureText: secure,
          style: TextStyle(
              color: Color(0xff77777a),
              height: 0.5,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: text,
            border: OutlineInputBorder(
              borderRadius: borderRadius,
            ),
          )));
}
