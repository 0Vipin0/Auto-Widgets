import 'package:flutter/material.dart';

class UserDetails {
  UserDetails(this.firstName, this.lastName);
  final String firstName;
  final String lastName;
}

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  UserDetails _userDetails = UserDetails('John', 'Doe');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Column(
        children: <Widget>[
          Text('First name: ${_userDetails.firstName}'),
          Text('Last name: ${_userDetails.lastName}'),
          RaisedButton.icon(
            label: Text('Edit (route builder)'),
            icon: Icon(Icons.edit),
            onPressed: () async {
              UserDetails result = await Navigator.push(
                context,
                MaterialPageRoute<UserDetails>(
                  builder: (BuildContext context) {
                    return EditUserDetailsPage(_userDetails);
                  },
                ),
              );
              if (result != null) {
                setState(() {
                  _userDetails = result;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

class EditUserDetailsPage extends StatefulWidget {
  EditUserDetailsPage(this.userDetails);
  final UserDetails userDetails;
  @override
  _EditUserDetailsPageState createState() =>
      _EditUserDetailsPageState(userDetails);
}

class _EditUserDetailsPageState extends State<EditUserDetailsPage> {
  _EditUserDetailsPageState(this._userDetails);
  UserDetails _userDetails;
  final GlobalKey<FormFieldState<String>> _firstNameKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _lastNameKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Details'),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            key: _firstNameKey,
            decoration: InputDecoration(
              labelText: 'First name',
            ),
            initialValue: _userDetails.firstName,
          ),
          TextFormField(
            key: _lastNameKey,
            decoration: InputDecoration(
              labelText: 'Last name',
            ),
            initialValue: _userDetails.lastName,
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: () {
              Navigator.pop(
                  context,
                  UserDetails(_firstNameKey.currentState?.value,
                      _lastNameKey.currentState?.value));
            },
          )
        ],
      ),
    );
  }
}

//UserDetails result = await Navigator.pushNamed(
//context,
//'/edit_user',
//arguments: _userDetails,
//);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/edit_user') {
          return MaterialPageRoute<UserDetails>(
            settings: settings,
            builder: (context) {
              return EditUserDetailsPage(settings.arguments);
            },
          );
        }
        return null;
      },
    );
  }
}
