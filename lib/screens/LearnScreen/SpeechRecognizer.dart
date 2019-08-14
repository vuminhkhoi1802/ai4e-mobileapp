import 'package:ai4e_mobileapp/widgets/fullWidthBtn/main.dart';
import "package:flutter/material.dart";
import 'package:speech_recognition/speech_recognition.dart';
import "package:ai4e_mobileapp/utils/dialogflow.dart";

class SpeechRecognizer extends StatefulWidget {
  @override
  SpeechRecognizerState createState() => SpeechRecognizerState();

  final addMessageCallback addMessage;

  SpeechRecognizer(this.addMessage);
}

typedef addMessageCallback = void Function(String, {bool isMine});

class SpeechRecognizerState extends State<SpeechRecognizer> {
  final _speech = SpeechRecognition();
  bool _speechRecognitionAvailable = false, _isListening = false;
  String transcription = "";
  final String _currentLocale = "en_US";
  void _response(String inp) async {
    var response = await getAnwser(inp);
    widget.addMessage(response, isMine: false);
  }

  void _speechInit() {
    _speech.setAvailabilityHandler(
        (bool result) => setState(() => _speechRecognitionAvailable = result));

    _speech.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));

    _speech.setRecognitionResultHandler((String text) {
      if (_isListening == false && text != "") {
        widget.addMessage(text);
        _response(text);
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
  }

  _stopRecord() async {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _speechInit();
    if (_speechRecognitionAvailable) {
      _activatePermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: fullWidthBtn(
        _isListening ? Colors.red : Colors.purple,
        Colors.white,
        _isListening ? "Press to Stop " : "Press to Record",
        _handlePress,
        paddingBottom: 0,
      ),
    );
  }
}
