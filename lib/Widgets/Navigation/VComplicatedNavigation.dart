import 'package:flutter/material.dart';

class UserOnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      body: Navigator(
        initialRoute: 'on_boarding/topic',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'on_boarding/topic':
              builder = (BuildContext context) {
                return UserOnBoardingTopicPage();
              };
              break;
            case 'on_boarding/follower':
              builder = (BuildContext context) {
                return UserOnBoardingFollowPage();
              };
              break;
          }
          return MaterialPageRoute(
            builder: builder,
            settings: settings,
          );
        },
      ),
    );
  }
}

class UserOnBoardingTopicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Select interested topics'),
        RaisedButton.icon(
          icon: Icon(Icons.arrow_forward),
          label: Text('Next'),
          onPressed: () {
            Navigator.pushNamed(context, 'on_boarding/follower');
          },
        ),
        RaisedButton.icon(
          icon: Icon(Icons.check),
          label: Text('Done'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ],
    );
  }
}
class UserOnBoardingFollowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
