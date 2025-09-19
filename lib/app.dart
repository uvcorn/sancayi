import 'package:flutter/material.dart';
import 'package:sancayi/features/home/ui/screens/home.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primaryColor: Color(0xFFD32F2F),
        fontFamily: 'NotoSansBengali', // Use a Bengali font if available
      ),
    );
  }
}
