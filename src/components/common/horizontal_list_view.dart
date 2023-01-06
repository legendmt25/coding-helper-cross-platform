import 'package:flutter/material.dart';

class Item {
  Key? key;
  void Function()? onTap;

  Item({this.key, this.onTap});
}

class HorizontalListView extends StatelessWidget {
  final String? title;
  final List<Item> items;

  const HorizontalListView({super.key, required this.items, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) Text(title!),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: items
                    .map(
                      (item) => ListTile(
                        key: item.key,
                        onTap: item.onTap,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
