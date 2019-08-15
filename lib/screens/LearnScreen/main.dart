import 'package:ai4e_mobileapp/utils/calculateScore.dart';
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
  @override
  void initState() {
    super.initState();
    isAssistant = widget.isAssistant;
    addMessage(
        "For this lesson, you should spent 3 minutes speaking about your ${widget.title == "Family" ? "family" : "beloved pet"}",
        isMine: false);
  }

  String voiceText;
  bool isAssistant = false;
  void setVoiceMsg() {
    setState(() {
      voiceText = "";
    });
  }

  void changeMode() {
    print(isAssistant);
    setState(() {
      isAssistant = !isAssistant;
    });
  }

  List<Map<String, dynamic>> message = [];
  void addMessage(String s,
      {bool isMine: true, bool shouldSpeak: true, bool isCard = false}) {
    var newS = message;
    newS.add({
      "message": s,
      "isMine": isMine,
      "isCard": isCard,
    });
    setState(() {
      message = newS;
      if (!isMine && shouldSpeak) {
        voiceText = s;
      }
    });
  }

  void addScore(Map<String, dynamic> score, int duration) {
    var sc = calculateScore(score, widget.title, duration).floor();
    addMessage("Your have scored $sc for this test",
        isMine: false, isCard: true);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> messageObject = message.map((m) {
      if (!m["isCard"])
        return Bubble(
          message: m["message"],
          isMine: m["isMine"],
        );
      return BubbleCard(
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
              isAssistant
                  ? SpeechRecognizer(
                      addMessage,
                    )
                  : RecordBtn(
                      addMessage: addMessage,
                      addScore: addScore,
                      changeMode: changeMode)
            ]),
      ),
    );
  }
}
