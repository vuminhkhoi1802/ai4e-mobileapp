//import 'dart:async';
//import 'package:path_provider/path_provider.dart';
//import 'dart:io' as io;

import "package:flutter/material.dart";
import "package:ai4e_mobileapp/screens/LearnScreen/Bubble.dart";
//import "package:ai4e_mobileapp/widgets/fullWidthBtn/main.dart";
//import 'package:audio_recorder/audio_recorder.dart';
//import "package:ai4e_mobileapp/utils/time.dart";

import 'SpeechRecognizer.dart';

class LearnScreen extends StatefulWidget {
  LearnScreen({Key key}) : super(key: key);

  LearnScreenState createState() => LearnScreenState();
}

class LearnScreenState extends State<LearnScreen> {
  List<Map<String, dynamic>> message = [
    {
      "message": 'Hi there, this is a message',
      "isMine": false,
    },
    {
      "message": 'Whatsapp like bubble talk',
      "isMine": false,
    },
    {
      "message": 'Nice one, Flutter is awesome',
      "isMine": true,
    },
    {
      "message": 'I\'ve told you so dude!',
      "isMine": false,
    },
  ];
  void addMessage(String s) {
    var newS = message;
    newS.add({"message": s, "isMine": true});
    setState(() {
      message = newS;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> messageObject = message.map((m) {
      return Bubble(
        message: m["message"],
        isMine: m["isMine"],
      );
    }).toList();
    var messageList = Flexible(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: messageObject,
      ),
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
          title: Text(
            "Family",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              messageList,
              Divider(),
              SpeechRecognizer(addMessage)
            ]),
      ),
    );
  }
}
