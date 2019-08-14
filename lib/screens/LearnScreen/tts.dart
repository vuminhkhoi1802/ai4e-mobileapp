import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped }

class TTS extends StatefulWidget {
  TTS({Key key, this.text, this.setMsg}) : super(key: key);
  final String text;
  final setMsg;
  _TTSState createState() => _TTSState();
}

class _TTSState extends State<TTS> {
  FlutterTts flutterTts;
  dynamic languages;
  dynamic voices;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    if (Platform.isAndroid) {
      flutterTts.ttsInitHandler(() {
        _getLanguages();
        _getVoices();
      });
    } else if (Platform.isIOS) {
      _getLanguages();
      _getVoices();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    if (languages != null) setState(() => languages);
  }

  Future _getVoices() async {
    voices = await flutterTts.getVoices;
    if (voices != null) setState(() => voices);
  }

  Future _speak(text) async {
    // print(text);
    if (text != null) {
      if (text.isNotEmpty) {
        var result = await flutterTts.speak(text);
        if (result == 1) {
          widget.setMsg();
          setState(() => ttsState = TtsState.playing);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _speak(widget.text);
    return Container();
  }
}
