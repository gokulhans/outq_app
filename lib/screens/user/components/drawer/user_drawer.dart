import 'package:flutter/material.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GFDrawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
