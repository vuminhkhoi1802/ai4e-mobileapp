import "package:flutter/material.dart";

Widget selectOption(colorBackgroundIcon, icon, title, subtitle, onTap,
    {colorIcon = Colors.white}) {
  return Container(
    child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                    child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: colorBackgroundIcon,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      icon,
                      color: colorIcon,
                      size: 40,
                    ),
                  ),
                  title: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ))))),
  );
}
