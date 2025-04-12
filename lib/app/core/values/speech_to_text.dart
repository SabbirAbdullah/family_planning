import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const SpeechTextField({Key? key, required this.controller, required this.hintText}) : super(key: key);

  @override
  _SpeechTextFieldState createState() => _SpeechTextFieldState();
}

class _SpeechTextFieldState extends State<SpeechTextField> {
  final SpeechToText _speech = SpeechToText();
  bool _isListening = false;

  Future<void> _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          setState(() {
            widget.controller.text = result.recognizedWords; // Update text field
            widget.controller.selection = TextSelection.fromPosition(
              TextPosition(offset: widget.controller.text.length),
            );
          });
        },
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(_isListening ? Icons.mic : Icons.mic_none, color: _isListening ? Colors.red : Colors.grey),
          onPressed: _isListening ? _stopListening : _startListening,
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
  }
