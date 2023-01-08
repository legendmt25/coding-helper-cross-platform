import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common/list_options.dart';
import '../../components/common/search_input.dart';
import '../../components/common/vertical_list_view.dart';
import '../../context/index.dart';
import '../../services/index.dart';

class ProblemsDiscoverPage extends StatefulWidget {
  const ProblemsDiscoverPage({super.key});

  @override
  State<ProblemsDiscoverPage> createState() => _ProblemsDiscoverPageState();
}

class _ProblemsDiscoverPageState extends State<ProblemsDiscoverPage> {
  final problemsService = const ProblemsService();

  final TextEditingController searchController = TextEditingController();
  bool showSearch = false;
  bool init = false;
  bool loading = false;

  List<String> options = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (init) {
      return;
    }
    setState(() {
      loading = true;
    });
    final problemsContext =
        Provider.of<ProblemsContext>(context, listen: false);
    problemsService
        .getProblemEntries()
        .then((entries) => problemsContext.setProblems(entries))
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

  void handleTapSearch() {
    if (searchController.text.isEmpty) {
      return;
    }

    String command =
        createCommand(Command.SEARCH, searchController.text.trim());
    setState(() {
      options.add(command);
      showSearch = false;
    });
    searchController.clear();
  }

  void handleClearSearch() {
    setState(() {
      showSearch = false;
    });
  }

  void handleRemoveOption(int index) {
    setState(() {
      options.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final problemsContext = Provider.of<ProblemsContext>(context);
    final navigator = Navigator.of(context);
    final problems = problemsContext.entries;
    return Scaffold(
      appBar: AppBar(
        title: !showSearch
            ? const Text('Discover')
            : SearchInput(
                controller: searchController,
                onClear: handleClearSearch,
                onSubmit: handleTapSearch,
              ),
        actions: [
          IconButton(
            onPressed: () {
              if (!showSearch) {
                setState(() {
                  showSearch = true;
                });
              } else {
                handleTapSearch();
              }
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.all(5).copyWith(bottom: 0),
              child: CustomScrollView(slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_alt),
                            label: const Text('Filter'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz_rounded),
                            label: const Text('Sort'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.settings),
                            label: const Text('View'),
                          ),
                        ],
                      ),
                      ListOptions(
                          options: options, onRemove: handleRemoveOption),
                      Expanded(
                        child: VerticalListView(
                          children: problems
                              .map(
                                (entry) => ListItem(
                                  title: entry.title,
                                  onTap: () => navigator.pushNamed(
                                    '/problem-overview',
                                    arguments: {'id': entry.id},
                                  ),
                                  subtitle: entry.description,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
    );
  }
}
