import 'package:flutter/material.dart';

import 'pages/initial_page.dart';
import 'components/layout/coding_helper_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final List<Widget> widgets = [
    const InitialPage(),
  ];

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'/': (context) => CodingHelperLayout(widgets)},
    );
  }
}
