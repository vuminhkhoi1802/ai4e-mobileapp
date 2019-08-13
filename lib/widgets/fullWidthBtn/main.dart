import "package:flutter/material.dart";

Widget fullWidthBtn(colorBackground, colorText, text, onPress,
    {paddingTop = 0,
    marginTop = 0,
    marginBottom = 0,
    marginLeft = 0,
    marginRight = 0}) {
  return Container(
      margin: EdgeInsets.only(
          top: marginTop.toDouble(),
          bottom: marginBottom.toDouble(),
          left: marginLeft.toDouble(),
          right: marginRight.toDouble()),
      child: Padding(
          padding: EdgeInsets.only(bottom: 15, top: paddingTop.toDouble()),
          child: SizedBox(
              height: 50,
              width: double.infinity,
              child: new RaisedButton(
                color: colorBackground,
                child: new Text(
                  text.toUpperCase(),
                  style: new TextStyle(fontSize: 15.0, color: colorText),
                ),
                onPressed: onPress,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              ))));
}
