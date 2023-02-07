import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:build_badge/build_badge.dart';

void main() {
  testWidgets('run', (tester) async {
    await tester.pumpWidget(
      BuildBadge(
        backgroundColor: const Color(0xFFFF0000),
        textColor: const Color(0xFF000000),
        text: "DEV",
        child: MaterialApp(
          title: "App Badge",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text("AppBar"),
            ),
            body: const Center(
              child: Text("Hello AppBadge World!"),
            ),
          ),
        )
      )
    );

    var d = find.byType(BuildBadge);
    expect(d, findsOneWidget);
  });
}
