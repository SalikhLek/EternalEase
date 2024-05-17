import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/quote_provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => QuoteProvider()..fetchQuotes()),
      ],
      child: MaterialApp(
        title: 'Мотивационное приложение',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
