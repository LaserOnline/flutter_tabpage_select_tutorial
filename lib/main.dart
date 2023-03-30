import 'package:flutter/material.dart';
import 'package:flutter_tabpage_select_tutorial/widget/Page01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page01(),
    );
  }
}
