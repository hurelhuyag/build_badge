import 'package:app_badge/app_badge.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Badge Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppBadge(
        text: "DEV",
        textColor: Colors.white,
        backgroundColor: Colors.red,
        child: HomePage()
      ),
    );
  }
}
