import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common/user_frame.dart';
import '../../components/common/vertical_list_view.dart';
import '../../context/index.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedContext = Provider.of<SharedContext>(context);
    final userData = sharedContext.userData;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Saved'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const UserFrame(),
              VerticalListView(
                children: [
                  ListItem(
                    title: 'Test project',
                    subtitle: 'language: ${'react'}',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
