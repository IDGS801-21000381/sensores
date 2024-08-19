import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorOrientatacionPage extends StatefulWidget {
  @override
  _SensorOrientatacionPage createState() => _SensorOrientatacionPage();
}

class _SensorOrientatacionPage extends State<SensorOrientatacionPage> {
  String _orientation = 'Unknown';

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        if (event.x.abs() > event.y.abs()) {
          if (event.x > 0) {
            _orientation = 'Izquierda';
          } else {
            _orientation = 'Derecha';
          }
        } else {
          if (event.y > 0) {
            _orientation = 'Arriba';
          } else {
            _orientation = 'Abajo';
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sensor de Orientación')),
      body: Center(child: Text('Orientación: $_orientation')),
    );
  }
}
