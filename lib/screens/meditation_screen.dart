import 'package:flutter/material.dart';

class MeditationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Звуки для медитации'),
      ),
      body: Center(
        child: Text('Контент со звуками для медитации'),
      ),
    );
  }
}
