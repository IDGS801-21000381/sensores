// import 'package:flutter/material.dart';
// import 'package:light/light.dart';

// class SensorBrilloPage extends StatefulWidget {
//   @override
//   _SensorBrightnessPageState createState() => _SensorBrightnessPageState();
// }

// class _SensorBrightnessPageState extends State<SensorBrilloPage> {
//   Light _light;
//   String _luxValue = 'Unknown';

//   @override
//   void initState() {
//     super.initState();
//     _light = Light();
//     _light.lightSensorStream.listen(onData);
//   }

//   void onData(int luxValue) {
//     setState(() {
//       _luxValue = "$luxValue lux";
//     });
//   }

//   @override
//   void dispose() {
//     _light.stop();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sensor de Brillo')),
//       body: Center(child: Text('Intensidad de luz: $_luxValue')),
//     );
//   }
// }
