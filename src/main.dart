import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'context/index.dart';
import 'pages/initial_page.dart';
import 'components/layout/coding_helper_layout.dart';
import 'pages/problems/problems_discover_page.dart';
import 'pages/problems/problems_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final List<Widget> widgets = [
    const InitialPage(),
    const ProblemsOverviewPage(),
  ];

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProblemsContext()),
        ChangeNotifierProvider(create: (context) => SharedContext()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => CodingHelperLayout(widgets),
          '/problem': (context) => const ProblemsOverviewPage(),
          '/problems-discover': (context) => const ProblemsDiscoverPage(),
        },
      ),
    );
  }
}
