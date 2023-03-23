// ignore_for_file: library_private_types_in_public_api

import '../Welcome Widgets/section_widgets/account_management.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './section_widgets/quiz_management.dart';
import './section_widgets/resume_management.dart';
import './section_widgets/question_management.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    AccountManagement(),
    QuestionManagement(),
    ResumeManagement(),
    QuizManagement(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Nav Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('AAT'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Questions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload_file_rounded),
              label: 'Resume \n MGMT',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: '  Quiz \n MGMT',
            ),
          ],
        ),
      ),
    );
  }
}
