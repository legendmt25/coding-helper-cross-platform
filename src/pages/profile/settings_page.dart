import 'package:flutter/material.dart';

import '../../components/common/dropdown.dart';
import '../../components/common/user_frame.dart';
import '../../components/common/vertical_list_view.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? selectedAccentColor;
  String? selectedDefaultLanguage;
  String? selectedTheme;
  String? selectedApplicationLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UserFrame(),
            VerticalListView(
              children: [
                ListItem(
                  title: 'Accent',
                  trailing: Dropdown(
                    value: selectedAccentColor,
                    onChange: (value) => setState(() {
                      selectedAccentColor = value;
                    }),
                    items: [
                      DropdownItem('Purple', 'purple'),
                      DropdownItem('Blue', 'blue'),
                      DropdownItem('Red', 'red'),
                    ],
                  ),
                ),
                ListItem(
                  title: 'Default language',
                  trailing: Dropdown(
                    value: selectedDefaultLanguage,
                    onChange: (value) => setState(() {
                      selectedDefaultLanguage = value;
                    }),
                    items: [
                      DropdownItem('Java', 'java'),
                    ],
                  ),
                ),
                ListItem(
                  title: 'Theme',
                  trailing: Dropdown(
                    value: selectedTheme,
                    onChange: (value) => setState(() {
                      selectedTheme = value;
                    }),
                    items: [
                      DropdownItem('Purple', 'purple'),
                      DropdownItem('Blue', 'blue'),
                      DropdownItem('Red', 'red'),
                    ],
                  ),
                ),
                ListItem(
                  title: 'Application language',
                  trailing: Dropdown(
                    value: selectedApplicationLanguage,
                    onChange: (value) => setState(() {
                      selectedApplicationLanguage = value;
                    }),
                    items: [
                      DropdownItem('English', 'en'),
                      DropdownItem('German', 'de'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
