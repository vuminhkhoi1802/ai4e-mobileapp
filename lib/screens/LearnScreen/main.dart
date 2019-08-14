import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

import "package:flutter/material.dart";
import "package:ai4e_mobileapp/screens/LearnScreen/Bubble.dart";
import "package:ai4e_mobileapp/widgets/fullWidthBtn/main.dart";
import 'package:audio_recorder/audio_recorder.dart';
import "package:ai4e_mobileapp/utils/time.dart";

class LearnScreen extends StatefulWidget {
  LearnScreen({Key key}) : super(key: key);

  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  bool isActive = false;
  int time = 180;
  Timer timer;
  Recording _recording = new Recording();

  startTimer(callback) {
    timer = Timer.periodic(const Duration(seconds: 1), callback);
  }

  cancelTimer() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
            Bubble(
              message: 'Hi there, this is a message',
              isTheir: false,
            ),
            Bubble(
              message: 'Whatsapp like bubble talk',
              isTheir: false,
            ),
            Bubble(
              message: 'Nice one, Flutter is awesome',
              isTheir: true,
            ),
            Bubble(
              message: 'I\'ve told you so dude!',
              isTheir: false,
            ),
            Divider(),
            Container(
              child: fullWidthBtn(
                isActive ? Colors.red : Colors.purple,
                Colors.white,
                isActive
                    ? "Press to Stop ${parseSecondToMinute(time)}"
                    : "Press to Record",
                _handlePress,
                paddingBottom: 0,
              ),
            )
          ],
        ),
      ),
    );
  }

  _handlePress() async {
    if (isActive) {
      _stopRecord();
    } else {
      _startRecord();
    }
  }

  _startRecord() async {
    await AudioRecorder.start();

    setState(() {
      _recording = new Recording(duration: new Duration(), path: "");
      isActive = true;
    });
    startTimer((timer) {
      setState(() {
        if (time > 0 && isActive) {
          time = time - 1;
        } else {
          _stopRecord();
        }
      });
    });
  }

  _stopRecord() async {
    var recording = await AudioRecorder.stop();
    print(recording.path);
    cancelTimer();
    time = 180;
    setState(() {
      isActive = false;
    });
  }
}
