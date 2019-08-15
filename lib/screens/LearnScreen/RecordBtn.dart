import 'dart:async';
import "dart:io" as io;
import 'package:ai4e_mobileapp/utils/uploadFile.dart';
import 'package:audio_recorder/audio_recorder.dart';
import "package:flutter/material.dart";
import "package:ai4e_mobileapp/widgets/fullWidthBtn/main.dart";
import 'package:path_provider/path_provider.dart';
import "package:ai4e_mobileapp/utils/time.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

typedef addMessageCallback = void Function(String,
    {bool isMine, bool shouldSpeak});
typedef addScoringDataCallback = void Function(
    Map<String, dynamic>, int duration);

class RecordBtn extends StatefulWidget {
  RecordBtn({Key key, this.addMessage, this.addScore, this.changeMode})
      : super(key: key);
  final addMessageCallback addMessage;
  final addScoringDataCallback addScore;
  final changeMode;
  _RecordBtnState createState() => _RecordBtnState();
}

class _RecordBtnState extends State<RecordBtn> {
  bool isActive = false;
  int time = 180;
  int duration = 0;
  Timer timer;
  Recording recording = Recording();
  String name;
  bool isConfirm = false;
  startTimer(callback) {
    timer = Timer.periodic(const Duration(seconds: 1), callback);
  }

  cancelTimer() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (!isConfirm)
      return Container(
          child: fullWidthBtn(
        isActive ? Colors.red : Colors.purple,
        Colors.white,
        isActive
            ? "Press to Stop ${parseSecondToMinute(time)}"
            : "Press to Record",
        _handlePress,
        paddingBottom: 0,
      ));
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "Send",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: _send,
            ),
            flex: 1,
          ),
          Expanded(
            child: RaisedButton(
              color: Colors.red,
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: _cancel,
            ),
            flex: 1,
          ),
        ],
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
    setState(() {
      name = DateTime.now().microsecondsSinceEpoch.toString();
    });
    io.Directory directory = await getApplicationDocumentsDirectory();
    widget.addMessage("Recording now", isMine: false, shouldSpeak: false);
    await AudioRecorder.start(
        path: '${directory.path}/$name',
        audioOutputFormat: AudioOutputFormat.WAV);
    setState(() {
      recording = new Recording(duration: new Duration(), path: "");
      isActive = true;
    });
    startTimer((timer) {
      if (time > 0 && isActive) {
        setState(() {
          time = time - 1;
        });
      } else {
        cancelTimer();
        _stopRecord();
      }
    });
  }

  _startFirestoreListen() {
    Firestore.instance.collection('evaluations').snapshots().listen((data) {
      data.documents.forEach((doc) {
        if (doc.documentID == "$name.data") {
          Map<String, dynamic> score = {"sentiment": {}, "topic": ""};
          var data = doc.data;
          score["sentiment"] = data["sentiment"];
          score["topic"] = data["topic"];
          widget.addScore(score, duration);
        }
      });
    });
  }

  _stopRecord() async {
    widget.addMessage("Stopping recording.", isMine: false, shouldSpeak: false);
    var _recording = await AudioRecorder.stop();
    setState(() {
      recording = _recording;
    });
    cancelTimer();
    time = 180;
    setState(() {
      isActive = false;
      isConfirm = true;
    });
  }

  _send() async {
    widget.addMessage("We are uploading your recording to the web.",
        isMine: false);
    setState(() {
      isConfirm = false;
      duration = recording.duration.inSeconds;
    });
    uploadFile(name, recording.path);
    widget.changeMode();
    setState(() {
      recording = Recording();
    });
    _startFirestoreListen();
  }

  _cancel() async {
    widget.addMessage("We are cancelling your recording.", isMine: false);
    setState(() {
      isConfirm = false;
      recording = Recording();
    });
  }
}
