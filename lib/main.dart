import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(ImcCalculator());

class ImcCalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imc Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF141419),
      ),
      home: InputPage(),
    );
  }
}
