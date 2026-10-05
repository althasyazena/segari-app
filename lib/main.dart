import 'package:segari_app/screen/splash_screen.dart';
import 'package:segari_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SegariApp());
}

class SegariApp extends StatelessWidget {
  const SegariApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Segari App",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: SplashScreen(),
    );
  }
}
