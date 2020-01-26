import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Sign Up'),
          onPressed: () {
            Navigator.pushNamed(context, '/sign_up');
          },
        ),
      ),
    );
  }
}

class PageNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Navigation',
      home: IndexPage(),
      routes: {
        '/sign_up': (context) => SignUpPage(),
        '/log_in': (context) => LogInPage(),
      },
    );
  }
}

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
