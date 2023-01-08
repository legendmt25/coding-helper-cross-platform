import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';

import '../components/common/code_editor.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final CodeController codeController = CodeController(
    language: CodeEditor.EDITOR_LANGUAGES['javascript'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial page'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
