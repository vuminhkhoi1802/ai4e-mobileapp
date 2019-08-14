import 'dart:async';

import 'package:ai4e_mobileapp/utils/time.dart';
import 'package:ai4e_mobileapp/widgets/fullWidthBtn/main.dart';
import "package:flutter/material.dart";
import 'package:speech_recognition/speech_recognition.dart';

class SpeechRecognizer extends StatefulWidget {
  @override
  SpeechRecognizerState createState() => SpeechRecognizerState();

  final addMessageCallback addMessage;

  SpeechRecognizer(this.addMessage);
}

typedef addMessageCallback = void Function(String);

class SpeechRecognizerState extends State<SpeechRecognizer> {
  int time = 180;
  Timer timer;
  final _speech = SpeechRecognition();
  bool _speechRecognitionAvailable = false, _isListening = false;
  String transcription = "";
  final String _currentLocale = "en_US";

  void _speechInit() {
    _speech.setAvailabilityHandler(
        (bool result) => setState(() => _speechRecognitionAvailable = result));

    _speech.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));

    _speech.setRecognitionResultHandler((String text) {
//      print("result: $text, isListening: $_isListening");
      if (_isListening == false && text != "") {
        widget.addMessage(text);
        setState(() {
          return transcription = text;
        });
      }
    });

    _speech.setRecognitionCompleteHandler(
        () => setState(() => _isListening = false));
  }

  void _activatePermission() {
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  startTimer(callback) {
    timer = Timer.periodic(const Duration(seconds: 1), callback);
  }

  cancelTimer() {
    timer.cancel();
  }

  _handlePress() async {
    if (_isListening) {
      _stopRecord();
    } else {
      _startRecord();
    }
  }

  _startRecord() async {
    _speech
        .listen(locale: _currentLocale)
        .then((result) => print('result : $result'));

    setState(() {
      _isListening = true;
    });

    startTimer((timer) {
      setState(() {
        if (time > 0 && _isListening) {
          time = time - 1;
        } else {
          _stopRecord();
        }
      });
    });
  }

  _stopRecord() async {
    cancelTimer();
    time = 180;
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _speechInit();
  }

  @override
  Widget build(BuildContext context) {
    if (_speechRecognitionAvailable == false) {
      return Container(
        child: fullWidthBtn(
          Colors.red,
          Colors.white,
          "Activate Speech",
          _activatePermission,
          paddingBottom: 0,
        ),
      );
    }
    return Container(
      child: fullWidthBtn(
        _isListening ? Colors.red : Colors.purple,
        Colors.white,
        _isListening
            ? "Press to Stop ${parseSecondToMinute(time)}"
            : "Press to Record",
        _handlePress,
        paddingBottom: 0,
      ),
    );
  }
}
