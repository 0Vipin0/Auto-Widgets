import 'package:flutter/material.dart';

class VDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Text('JD'),
            ),
            accountName: Text('John Doe'),
            accountEmail: Text('john.doe@example.com'),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
          ),
        ],
      ),
    );
  }
}
