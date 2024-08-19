import 'package:flutter/material.dart';
//import 'sensor_brightness.dart';
import 'sensor_orientatacion.dart';
// import 'sensor_proximidad.dart';
import 'sensor_acceleracion.dart';
import 'sensor_magnometro.dart';
//import 'sensor_barometer.dart';
import 'sensor_huella.dart';
import 'sensor_temperatura.dart';
import 'sensor_voz.dart';
import 'sensor_color.dart';
import 'sensor_localizacion.dart';

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
              Icons.screen_rotation, SensorOrientatacionPage()),
          // _buildSensorItem(context, 'Sensor de Proximidad', Icons.sensors,
          //     SensorProximityPage()),
          _buildSensorItem(context, 'Sensor Acelerómetro', Icons.directions_run,
              SensorAcceleracionPage()),
          _buildSensorItem(context, 'Sensor Magnetómetro', Icons.explore,
              SensorMagnetometerPage()),
          // _buildSensorItem(
          //     context, 'Sensor Barómetro', Icons.speed, SensorBarometerPage()),
          _buildSensorItem(context, 'Sensor de Huellas', Icons.fingerprint,
              SensorbrilloPage()),
          _buildSensorItem(context, 'Sensor de Temperatura', Icons.thermostat,
              SensorTemperaturaPage()),
          _buildSensorItem(context, 'Transcribir lo que escucha', Icons.mic,
              SensorVozPage()),
          _buildSensorItem(context, 'Detección de Colores', Icons.color_lens,
              SensorColorPage()),
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
