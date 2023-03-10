import 'package:build_badge/build_badge.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildBadge(
      text: "DEV",
      textColor: Colors.white,
      backgroundColor: Colors.red,
      visible: true,
      child: MaterialApp(
        title: 'Build Badge Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
