import 'package:flutter/material.dart';
import 'package:iara/presentation/splash/pages/splash.dart';
import 'package:iara/core/configs/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AILA',
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
