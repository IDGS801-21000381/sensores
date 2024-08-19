import 'package:flutter/material.dart';

class SensorTemperaturaPage extends StatefulWidget {
  @override
  _SensorTemperaturaPage createState() => _SensorTemperaturaPage();
}

class _SensorTemperaturaPage extends State<SensorTemperaturaPage> {
  // Note: Temperature sensors are rare in smartphones, usually available only on specific devices or in external devices.
  double _temperature = 25.0; // Mock data as an example.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sensor de Temperatura')),
      body: Center(
        child: Text('Temperatura: $_temperature °C'),
      ),
    );
  }
}
