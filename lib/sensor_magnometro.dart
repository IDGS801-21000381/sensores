import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorMagnetometerPage extends StatefulWidget {
  @override
  _SensorMagnetometerPageState createState() => _SensorMagnetometerPageState();
}

class _SensorMagnetometerPageState extends State<SensorMagnetometerPage> {
  double _x = 0.0, _y = 0.0, _z = 0.0;

  @override
  void initState() {
    super.initState();
    magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sensor Magnetómetro')),
      body: Center(
        child: Text('x: $_x, y: $_y, z: $_z'),
      ),
    );
  }
}
