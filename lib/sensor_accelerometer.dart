import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorAccelerometerPage extends StatefulWidget {
  @override
  _SensorAccelerometerPageState createState() =>
      _SensorAccelerometerPageState();
}

class _SensorAccelerometerPageState extends State<SensorAccelerometerPage> {
  double _x = 0.0, _y = 0.0, _z = 0.0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
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
      appBar: AppBar(title: Text('Sensor Acelerómetro')),
      body: Center(
        child: Text('x: $_x, y: $_y, z: $_z'),
      ),
    );
  }
}
