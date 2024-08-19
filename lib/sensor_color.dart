import 'dart:io'; // Necesario para File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';

class SensorColorPage extends StatefulWidget {
  @override
  _SensorColorDetectionPageState createState() =>
      _SensorColorDetectionPageState();
}

class _SensorColorDetectionPageState extends State<SensorColorPage> {
  Color _dominantColor = Colors.transparent;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        FileImage(file),
      );
      setState(() {
        _dominantColor =
            paletteGenerator.dominantColor?.color ?? Colors.transparent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detección de Color')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              color: _dominantColor,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Seleccionar Imagen'),
            ),
          ],
        ),
      ),
    );
  }
}
