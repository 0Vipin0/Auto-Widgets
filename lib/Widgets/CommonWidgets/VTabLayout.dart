import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = [
    Tab(text: 'List', icon: Icon(Icons.list)),
    Tab(text: 'Map', icon: Icon(Icons.map)),
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab'),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: _tabs.map((tab) {
          return Center(
            child: Text(tab.text),
          );
        }).toList(),
        controller: _tabController,
      ),
    );
  }
}

class DefaultTabControllerPage extends StatelessWidget {
  final List<Tab> _tabs = [
    Tab(text: 'List', icon: Icon(Icons.list)),
    Tab(text: 'Map', icon: Icon(Icons.map))
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: _tabs),
        ),
        body: TabBarView(
          children: _tabs.map((tab) {
            return Center(
              child: Text(tab.text),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CupertinoTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.info)),
      ]),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return Center(
              child: Text('Tab $index'),
            );
          },
        );
      },
    );
  }
}
