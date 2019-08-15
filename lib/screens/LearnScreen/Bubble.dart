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
          child: Text(
            message,
            style: TextStyle(color: isMine ? Color(0xFF174EA6) : Colors.black),
          ),
        )
      ],
    );
  }
}

class BubbleCard extends StatelessWidget {
  const BubbleCard({this.message, this.isMine});
  final String message;
  final bool isMine;

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
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text("Your Score"),
                    subtitle: Container(child: Text(message)),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Next'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
