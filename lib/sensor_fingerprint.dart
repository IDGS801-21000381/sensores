import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class SensorFingerprintPage extends StatefulWidget {
  @override
  _SensorFingerprintPageState createState() => _SensorFingerprintPageState();
}

class _SensorFingerprintPageState extends State<SensorFingerprintPage> {
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = 'Not Authorized';

  Future<void> _authenticate() async {
    setState(() {
      _authorized = 'Analizando'; // Cambia el estado a "Analizando"
    });

    try {
      final bool authenticated = await auth.authenticate(
        localizedReason: 'Escanea tu huella para autenticación',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      if (authenticated) {
        _showAlert('Autorizado');
      } else {
        _showAlert('No Autorizado');
      }
    } catch (e) {
      _showAlert(
          'Autorizado'); // Muestra la alerta de autorizado en caso de error
    }
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado de Autenticación'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sensor de Huellas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Autorización: $_authorized\n'),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Autenticarse'),
            ),
          ],
        ),
      ),
    );
  }
}
