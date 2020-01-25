import 'package:flutter/material.dart';

class VBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.cake),
          title: Text('Cake'),
          backgroundColor: Colors.red.shade100,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Map'),
          backgroundColor: Colors.green.shade100,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm),
          title: Text('Alarm'),
          backgroundColor: Colors.blue.shade100,
        ),
      ],
    );
  }
}
