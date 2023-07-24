import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gradient_from_image/pages/gradient_page/gradient_page.dart';
import 'package:gradient_from_image/pages/setup_page/setup_page.dart';
import 'package:image/image.dart' as img;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: SetupPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
