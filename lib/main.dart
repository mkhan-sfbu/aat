import 'package:flutter/material.dart';
import './reusesablewidget/reusesablewidget.dart';
import './takequiz.dart';
import './widgets/signin.dart';
import './widgets/newsignin.dart';
import './widgets/signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: const MyHomePage(title: 'Applicant Assessment Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // final Function()? onTap;
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: sized_box_for_whitespace
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/images/test_avatar.png',
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                        child: Container(
                      width: 180,
                      height: 180,
                      // color: Color(0xFF80C038),
                      alignment: Alignment.center,
                      child: (Image.asset(
                        "assets/images/project_logo.png",
                      )),
                    )),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 50),
                  // ignore: prefer_const_constructors
                  Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 50),
                  // ignore: prefer_const_constructors
                  Text('AAT is here for you.\n Explore Now',
                      textAlign: TextAlign.center,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: signInsignUpButton(context, "LOGIN", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // ignore: prefer_const_constructors
                                builder: (context) => SignIn()));
                      })),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: signInsignUpButton(context, "SIGNUP", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // ignore: prefer_const_constructors
                                builder: (context) => SignUp()));
                      })),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: signInsignUpButton(context, "Take Quiz", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // ignore: prefer_const_constructors
                                builder: (context) => TakeQuizPage()));
                      })),
                ]),
          )
        ],
      ),
    ));
  }
}

