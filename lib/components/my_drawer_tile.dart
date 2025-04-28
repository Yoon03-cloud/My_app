import 'package:flutter/material.dart';

/* 
Drawer tile
this is a simple tile for each item in the menu drawer
-------------------------------------------------------

To use this widget , you need:
-title
-icon
function
*/
class MyDrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const MyDrawerTile ({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap
  });

// Buile UI 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      onTap: onTap,
    );
  }
}