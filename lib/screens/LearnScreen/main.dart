import 'package:ai4e_mobileapp/screens/LearnScreen/Loader.dart';
import 'package:ai4e_mobileapp/utils/calculateScore.dart';
import "package:flutter/material.dart";
import "package:ai4e_mobileapp/screens/LearnScreen/Bubble.dart";
import 'SpeechRecognizer.dart';
import "./RecordBtn.dart";
import "./tts.dart";
import "package:ai4e_mobileapp/mobx/main.dart";
import "package:wave/wave.dart";
import "package:wave/config.dart";

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
    if (!isAssistant)
      addMessage(
          "For this lesson, you should spent 3 minutes speaking about your ${widget.title == "Family" ? "family" : "beloved pet"}",
          isMine: false);
  }

  String voiceText;
  bool isAssistant = false;
  bool isLoading = false;
  bool isListening = false;
  double rms = 0;
  void setVoiceMsg() {
    setState(() {
      voiceText = "";
    });
  }

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void setRMS(state, rms) {
    setState(() {
      isListening = state;
      rms = rms;
    });
  }

  void changeMode() {
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
    changeMode();
    user.increaseScore(sc.toInt());
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
          addMessage: addMessage,
          title: widget.title);
    }).toList(growable: true);
    if (isLoading) {
      messageObject.add(Container(
        child: ColorLoader4(),
        padding: EdgeInsets.all(20),
      ));
    }
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
              isListening
                  ? Container(
                      child: WaveWidget(
                        config: CustomConfig(
                          gradients: [
                            [Colors.red, Color(0xEEF44336)],
                            [Colors.red[800], Color(0x77E57373)],
                            [Colors.orange, Color(0x66FF9800)],
                            [Colors.yellow, Color(0x55FFEB3B)]
                          ],
                          durations: [10000, 8000, 3000, 1000],
                          heightPercentages: [0.20, 0.23, 0.25, 0.30],
                          blur: MaskFilter.blur(BlurStyle.solid, 10),
                          gradientBegin: Alignment.bottomLeft,
                          gradientEnd: Alignment.topRight,
                        ),
                        size: Size(double.infinity, 40),
                        backgroundColor: Colors.transparent,
                      ),
                    )
                  : SizedBox(width: double.infinity, height: 40),
              Divider(),
              isAssistant
                  ? SpeechRecognizer(addMessage, toggleLoading, setRMS)
                  : RecordBtn(
                      addMessage: addMessage,
                      addScore: addScore,
                      changeMode: changeMode)
            ]),
      ),
    );
  }
}
