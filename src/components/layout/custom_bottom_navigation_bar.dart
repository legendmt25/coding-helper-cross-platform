import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int pageIndex;
  final void Function(int value) onChange;

  const CustomBottomNavigationBar(this.pageIndex, this.onChange, {super.key});

  @override
  Widget build(BuildContext context) {
    const navigationBarItemActiveColor = Colors.lightBlue;

    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: onChange,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'Home',
          activeIcon: Icon(
            Icons.abc,
            color: navigationBarItemActiveColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          activeIcon: Icon(
            Icons.person,
            color: navigationBarItemActiveColor,
          ),
        ),
      ],
    );
  }
}
