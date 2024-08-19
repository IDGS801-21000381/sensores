import 'package:flutter/material.dart';
//import 'sensor_brightness.dart';
import 'sensor_orientation.dart';
// import 'sensor_proximity.dart';
import 'sensor_accelerometer.dart';
import 'sensor_magnetometer.dart';
//import 'sensor_barometer.dart';
import 'sensor_fingerprint.dart';
import 'sensor_temperature.dart';
import 'sensor_voice_recognition.dart';
import 'sensor_color_detection.dart';
import 'sensor_location.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sensores',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF400006),
      ),
      body: ListView(
        children: [
          // _buildSensorItem(context, 'Sensor de Brillo', Icons.wb_sunny,
          //     SensorBrightnessPage()),
          _buildSensorItem(context, 'Sensor de Orientación',
              Icons.screen_rotation, SensorOrientationPage()),
          // _buildSensorItem(context, 'Sensor de Proximidad', Icons.sensors,
          //     SensorProximityPage()),
          _buildSensorItem(context, 'Sensor Acelerómetro', Icons.directions_run,
              SensorAccelerometerPage()),
          _buildSensorItem(context, 'Sensor Magnetómetro', Icons.explore,
              SensorMagnetometerPage()),
          // _buildSensorItem(
          //     context, 'Sensor Barómetro', Icons.speed, SensorBarometerPage()),
          _buildSensorItem(context, 'Sensor de Huellas', Icons.fingerprint,
              SensorFingerprintPage()),
          _buildSensorItem(context, 'Sensor de Temperatura', Icons.thermostat,
              SensorTemperaturePage()),
          _buildSensorItem(context, 'Transcribir lo que escucha', Icons.mic,
              SensorVoiceRecognitionPage()),
          _buildSensorItem(context, 'Detección de Colores', Icons.color_lens,
              SensorColorDetectionPage()),
          _buildSensorItem(context, 'Ubicación con Google Maps',
              Icons.location_on, SensorLocationPage()),
        ],
      ),
    );
  }

  Widget _buildSensorItem(
      BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      color: Colors.black,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
