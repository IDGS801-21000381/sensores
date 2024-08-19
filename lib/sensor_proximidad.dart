// import 'package:flutter/material.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// class SensorProximityPage extends StatefulWidget {
//   @override
//   _SensorProximityPageState createState() => _SensorProximityPageState();
// }

// class _SensorProximityPageState extends State<SensorProximityPage> {
//   double _proximity = 0.0;
//   StreamSubscription? _subscription;

//   @override
//   void initState() {
//     super.initState();
//     _initSensor();
//   }

//   void _initSensor() {
//     _subscription = SensorsPlus.proximityEvents.listen((event) {
//       if (mounted) {
//         setState(() {
//           _proximity = event;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _subscription
//         ?.cancel(); // Cancela la suscripción cuando el widget se elimina
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sensor de Proximidad')),
//       body: Center(child: Text('Proximidad: $_proximity')),
//     );
//   }
// }
