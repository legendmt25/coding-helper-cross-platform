import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'context/index.dart';
import 'pages/initial_page.dart';
import 'components/layout/coding_helper_layout.dart';
import 'pages/problems/problem_overview_page.dart';
import 'pages/problems/problems_discover_page.dart';
import 'pages/problems/problems_overview_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/profile/saved_page.dart';
import 'pages/profile/settings_page.dart';
import 'pages/profile/stats_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final List<Widget> widgets = [
    const InitialPage(),
    const ProblemsOverviewPage(),
    const ProfilePage(),
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
          '/problem-overview': (context) => const ProblemOverviewPage(),
          '/problems-discover': (context) => const ProblemsDiscoverPage(),
          '/stats': (context) => const StatsPage(),
          '/saved': (context) => const SavedPage(),
          '/settings': (context) => const SettingsPage(),
        },
      ),
    );
  }
}
