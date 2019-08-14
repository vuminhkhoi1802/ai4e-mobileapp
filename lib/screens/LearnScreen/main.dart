import "package:flutter/material.dart";
import "package:ai4e_mobileapp/screens/LearnScreen/Bubble.dart";
import 'SpeechRecognizer.dart';
import "./RecordBtn.dart";
import "./tts.dart";

class LearnScreen extends StatefulWidget {
  LearnScreen({Key key, this.isAssistant, this.title}) : super(key: key);
  final bool isAssistant;
  final String title;
  LearnScreenState createState() => LearnScreenState();
}

class LearnScreenState extends State<LearnScreen> {
  String voiceText;
  void setVoiceMsg() {
    setState(() {
      voiceText = "";
    });
  }

  List<Map<String, dynamic>> message = [
    {
      "message": 'Hello, Welcome to the Speaking Trainer',
      "isMine": false,
    }
  ];
  void addMessage(String s, {bool isMine: true}) {
    var newS = message;
    newS.add({"message": s, "isMine": isMine});
    setState(() {
      message = newS;
      if (!isMine) {
        voiceText = s;
      }
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            widget.title == "" ? "Assistant" : widget.title,
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
              TTS(text: voiceText, setMsg: setVoiceMsg),
              messageList,
              Divider(),
              widget.isAssistant
                  ? SpeechRecognizer(addMessage)
                  : RecordBtn(addMessage: addMessage)
            ]),
      ),
    );
  }
}
