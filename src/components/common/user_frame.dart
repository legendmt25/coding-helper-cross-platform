import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../context/index.dart';

const String DEFAULT_IMAGE_URL = 'https://media.istockphoto.com/id/1300845620' +
    '/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.webp' +
    '?s=612x612&w=is&k=20&c=PJjJWl0njGyow3AefY7KVNuhkbw5r2skqFiCFM5kyic=';

class UserFrame extends StatelessWidget {
  const UserFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedContext = Provider.of<SharedContext>(context);
    final userData = sharedContext.userData;

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  userData?.image ?? DEFAULT_IMAGE_URL,
                ),
              ),
              Text(userData?.username ?? 'Not logged in!')
            ],
          ),
        ),
      ),
    );
  }
}
