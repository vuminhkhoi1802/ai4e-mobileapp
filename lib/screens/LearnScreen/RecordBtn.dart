import 'dart:async';
import "dart:io" as io;
import 'package:audio_recorder/audio_recorder.dart';
import "package:flutter/material.dart";
import "package:ai4e_mobileapp/widgets/fullWidthBtn/main.dart";
import 'package:path_provider/path_provider.dart';
import "package:ai4e_mobileapp/utils/time.dart";

class RecordBtn extends StatefulWidget {
  RecordBtn({Key key}) : super(key: key);

  _RecordBtnState createState() => _RecordBtnState();
}

class _RecordBtnState extends State<RecordBtn> {
  bool isActive = false;
  int time = 180;
  Timer timer;
  Recording recording = new Recording();

  startTimer(callback) {
    timer = Timer.periodic(const Duration(seconds: 1), callback);
  }

  cancelTimer() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
  }

  _handlePress() async {
    if (isActive) {
      _stopRecord();
    } else {
      _startRecord();
    }
  }

  _startRecord() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    await AudioRecorder.start(
        path: '${directory.path}/${DateTime.now().microsecondsSinceEpoch}',
        audioOutputFormat: AudioOutputFormat.WAV);

    setState(() {
      recording = new Recording(duration: new Duration(), path: "");
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
