import 'package:flutter/material.dart';

class FloatingTile extends StatelessWidget {
  final void Function()? onClick;
  final String title;
  final Widget? image;

  const FloatingTile({
    super.key,
    this.onClick,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Center(child: image),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title)
      ],
    );
  }
}
