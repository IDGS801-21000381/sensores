// import 'package:flutter/material.dart';
// import 'package:flutter_barometer_plugin/flutter_barometer.dart';
// import 'dart:async'; // Asegúrate de importar esta librería

// class SensorBarometerPage extends StatefulWidget {
//   @override
//   _SensorBarometerPageState createState() => _SensorBarometerPageState();
// }

// class _SensorBarometerPageState extends State<SensorBarometerPage> {
//   double _pressure = 0.0;
//   late StreamSubscription _subscription; // Declaración del StreamSubscription

//   @override
//   void initState() {
//     super.initState();
//     _subscription = FlutterBarometer().barometerUpdates.listen((event) {
//       setState(() {
//         _pressure = event.hectopascals;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _subscription.cancel(); // Cancela la suscripción al salir de la pantalla
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sensor Barómetro')),
//       body: Center(
//         child: Text('Presión: $_pressure hPa'),
//       ),
//     );
//   }
// }
