import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/common/user_frame.dart';

const avatarUrl =
    'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.webp?s=612x612&w=is&k=20&c=PJjJWl0njGyow3AefY7KVNuhkbw5r2skqFiCFM5kyic=';
const username = 'Username';

class StatsPage extends StatelessWidget {
  static const List<Map<String, String>> data = [
    {
      'Problems solved': '90',
      'Easy': '56',
      'Medium': '23',
      'Hard': '11',
    },
    {
      'Courses finished': '90',
      'Easy': '56',
      'Medium': '23',
      'Hard': '11',
    },
    {
      'Comments': '35',
      'Posts': '12',
    },
  ];

  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stats'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_constructors
          children: [
            const UserFrame(),
            ...data
                .map(
                  (m) => Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: m.entries
                            .map(
                              (entry) => [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(entry.key),
                                    Text(entry.value),
                                  ],
                                ),
                                const Divider()
                              ],
                            )
                            .expand((element) => element)
                            .take(2 * m.length - 1)
                            .toList(),
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
