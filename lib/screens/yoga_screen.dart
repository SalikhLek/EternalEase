import 'package:flutter/material.dart';

class YogaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Упражнения йоги'),
      ),
      body: Center(
        child: Text('Контент с упражнениями йоги'),
      ),
    );
  }
}
