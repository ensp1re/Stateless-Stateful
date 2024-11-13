import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CornerRadiusConfigScreen(),
    );
  }
}

class CornerRadiusConfigScreen extends StatefulWidget {
  @override
  _CornerRadiusConfigScreenState createState() =>
      _CornerRadiusConfigScreenState();
}

class _CornerRadiusConfigScreenState extends State<CornerRadiusConfigScreen> {
  double _tlRadius = 0.0;
  double _trRadius = 0.0;
  double _blRadius = 0.0;
  double _brRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corner Radius Configurator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildSlider('TL', _tlRadius, (value) {
              setState(() {
                _tlRadius = value;
              });
            }),
            _buildSlider('TR', _trRadius, (value) {
              setState(() {
                _trRadius = value;
              });
            }),
            _buildSlider('BL', _blRadius, (value) {
              setState(() {
                _blRadius = value;
              });
            }),
            _buildSlider('BR', _brRadius, (value) {
              setState(() {
                _brRadius = value;
              });
            }),
            SizedBox(height: 20),
            BlueContainer(
              tlRadius: _tlRadius,
              trRadius: _trRadius,
              blRadius: _blRadius,
              brRadius: _brRadius,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(String label, double value, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label),
        Slider(
          value: value,
          min: 0.0,
          max: 50.0,
          onChanged: onChanged,
          divisions: 50,
          label: value.toStringAsFixed(1),
        ),
        Text('Radius: ${value.toStringAsFixed(1)}'),
        SizedBox(height: 10),
      ],
    );
  }
}

class BlueContainer extends StatelessWidget {
  final double tlRadius;
  final double trRadius;
  final double blRadius;
  final double brRadius;

  BlueContainer({
    required this.tlRadius,
    required this.trRadius,
    required this.blRadius,
    required this.brRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(tlRadius),
            topRight: Radius.circular(trRadius),
            bottomLeft: Radius.circular(blRadius),
            bottomRight: Radius.circular(brRadius),
          ),
        ),
      ),
    );
  }
}
