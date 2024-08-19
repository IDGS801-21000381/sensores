import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SensorLocationPage extends StatefulWidget {
  @override
  _SensorLocationPageState createState() => _SensorLocationPageState();
}

class _SensorLocationPageState extends State<SensorLocationPage> {
  Position? _currentPosition;
  String _locationMessage = 'Obteniendo ubicación...';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica si los servicios de ubicación están habilitados
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = 'Los servicios de ubicación están desactivados.';
      });
      return;
    }

    // Verifica los permisos de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        setState(() {
          _locationMessage = 'Permisos de ubicación denegados.';
        });
        return;
      }
    }

    // Obtén la ubicación actual
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      _locationMessage =
          'Latitud: ${_currentPosition?.latitude}, Longitud: ${_currentPosition?.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sensor de Localización')),
      body: Center(
        child: _currentPosition == null
            ? Text(_locationMessage)
            : Text(
                'Latitud: ${_currentPosition?.latitude}, Longitud: ${_currentPosition?.longitude}'),
      ),
    );
  }
}
