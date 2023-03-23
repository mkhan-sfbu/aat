import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountManagement extends StatefulWidget {
  const AccountManagement({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AccountManagementState createState() => _AccountManagementState();
}

class _AccountManagementState extends State<AccountManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('User Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 40,
                // ignore: prefer_const_constructors
                child: Text(
                  'About',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                // height: 60,
                // ignore: prefer_const_constructors
                child: Text(
                    'This is your account below is your Username or Email Address. You have the choice to logout anytime you feel like',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    textAlign: TextAlign.justify),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showSignOutDialog(context);
                },
                // ignore: prefer_const_constructors
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signOut() async {
    // Implement sign-out functionality here
    Navigator.pop(context);
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // ignore: prefer_const_constructors
          title: Text('Sign Out'),
          // ignore: prefer_const_constructors
          content: Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // FirebaseAuth.instance.signOut();
                _signOut();
              },
              // ignore: prefer_const_constructors
              child: Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }
}
