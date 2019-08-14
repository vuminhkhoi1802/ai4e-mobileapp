import "package:flutter/material.dart";

class Bubble extends StatelessWidget {
  Bubble({this.message, this.isMine});

  final String message;
  final isMine;

  @override
  Widget build(BuildContext context) {
    final bg = isMine ? Color(0xFFD2E3FC) : Color(0xFFf1f3f4);
    final align = isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = BorderRadius.circular(10);
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Text(
                message,
                style: TextStyle(
                    color: isMine ? Color(0xFF174EA6) : Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }
}