import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const NavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        // Add more items for each tab if necessary
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context)
          .colorScheme
          .secondary, // Use the secondary color from your theme
      onTap: onItemSelected,
    );
  }
}
