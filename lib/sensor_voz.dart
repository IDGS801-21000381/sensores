import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SensorVozPage extends StatefulWidget {
  @override
  _SensorVozPageState createState() => _SensorVozPageState();
}

class _SensorVozPageState extends State<SensorVozPage> {
  stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListening = false;
  String _text = "Presiona el botón para comenzar a hablar";

  @override
  void initState() {
    super.initState();
  }

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _speechToText.stop();
      setState(() {
        _isListening = false;
      });
    } else {
      bool available = await _speechToText.initialize();
      if (available) {
        _speechToText.listen(
          onResult: (result) {
            setState(() {
              _text = result.recognizedWords;
            });
          },
        );
        setState(() {
          _isListening = true;
        });
      } else {
        setState(() {
          _text = "No se pudo inicializar el reconocimiento de voz.";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reconocimiento de Voz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _text,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleListening,
              child: Text(_isListening ? 'Detener' : 'Iniciar'),
            ),
          ],
        ),
      ),
    );
  }
}
