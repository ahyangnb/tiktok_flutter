import 'package:flutter/material.dart';
import 'package:tiktok_flutter/page/tiktok_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tiktok Gestures",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.black,
      ),
      home: TikTokPage(),
    );
  }
}


