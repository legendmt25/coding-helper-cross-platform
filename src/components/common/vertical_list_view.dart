import 'package:flutter/material.dart';

class ListItem {
  String? title;
  String? subtitle;
  Widget? image;
  void Function()? onTap;

  ListItem({this.title, this.subtitle, this.image, this.onTap});
}

class VerticalListView extends StatelessWidget {
  final List<ListItem> children;

  const VerticalListView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      elevation: 10,
      child: ListView(
        children: children
            .map(
              (item) => [
                InkWell(
                  onTap: item.onTap,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Icon(Icons.abc, size: 32),
                    ),
                    title: item.title != null ? Text(item.title!) : null,
                    subtitle:
                        item.subtitle != null ? Text(item.subtitle!) : null,
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                )
              ],
            )
            .expand((element) => element)
            .toList(),
      ),
    );
    ;
  }
}
