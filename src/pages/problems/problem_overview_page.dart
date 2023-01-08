import 'package:flutter/material.dart';

import '../../components/common/code_editor.dart';
import '../../components/common/vertical_list_view.dart';
import '../../context/index.dart';
import '../../services/index.dart';
import 'problem_arena_page.dart';

class ProblemOverviewPage extends StatefulWidget {
  const ProblemOverviewPage({super.key});

  @override
  State<ProblemOverviewPage> createState() => _ProblemOverviewPageState();
}

class _ProblemOverviewPageState extends State<ProblemOverviewPage> {
  final ProblemsService problemsService = const ProblemsService();
  ProblemEntry? problem;
  String? id;
  bool init = false;
  bool loading = false;

  String selectedLanguage = CodeEditor.EDITOR_LANGUAGES.keys.first;

  void handleTapStart() {
    final navigator = Navigator.of(context);
    navigator.push(
      MaterialPageRoute(
        builder: (context) => ProblemArenaPage(),
        settings: RouteSettings(
          arguments: {
            'problem': problem,
            'language': selectedLanguage,
          },
        ),
      ),
    );
  }

  void handleChangeLanguage(String? language) {
    setState(() {
      selectedLanguage = language as String;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (init) {
      return;
    }

    setState(() {
      loading = true;
    });

    final params =
        ModalRoute.of(context)?.settings.arguments as Map<String, String?>;
    id = params['id'];

    if (id == null) {
      throw Error();
    }

    problemsService
        .getProblemEntry(id!)
        .then((entry) => setState(() {
              problem = entry;
            }))
        .onError(
          (error, stackTrace) => handleError(context, ErrorCode.PROBLEMS),
        )
        .whenComplete(
      () {
        init = true;
        setState(() {
          loading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(problem?.title ?? ''),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.3,
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Icon(Icons.abc, size: 64),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Difficulty ${problem?.code}'),
                              Text('Duration ${problem?.code}'),
                              Text('Participants ${problem?.code}'),
                              Text('Reviews ${problem?.code}'),
                            ],
                          )
                        ],
                      ),
                      Text(problem!.title),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton(
                            value: selectedLanguage,
                            items: CodeEditor.EDITOR_LANGUAGES.keys
                                .map(
                                  (language) => DropdownMenuItem(
                                    value: language,
                                    child: Text(language),
                                  ),
                                )
                                .toList(),
                            onChanged: handleChangeLanguage,
                          ),
                          ElevatedButton(
                              onPressed: handleTapStart,
                              child: const Text('Start'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Description'),
                    Text(problem!.description ?? 'No description')
                  ],
                ),
              ),
            ),
            Expanded(
              child: VerticalListView(
                children: [
                  ListItem(title: 'Attempt 1', subtitle: 'Test cases 8/8'),
                  ListItem(title: 'Attempt 1', subtitle: 'Test cases 8/8'),
                  ListItem(title: 'Attempt 1', subtitle: 'Test cases 8/8'),
                  ListItem(title: 'Attempt 1', subtitle: 'Test cases 8/8'),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
