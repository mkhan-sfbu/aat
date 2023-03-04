import 'package:flutter/material.dart';
import './reusesablewidget/reusesablewidget.dart';
import './widgets/welcome.dart';
import './widgets/signin.dart';
import './widgets/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Applicant Assessment Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
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

                      // ignore: prefer_const_constructors
                      // SizedBox(
                      //   height: 40,
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: signInsignUpButton(context, "REGISTER", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // ignore: prefer_const_constructors
                                  builder: (context) => SignUp()));
                        }),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: signInsignUpButton(context, "LOGIN", () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // ignore: prefer_const_constructors
                                    builder: (context) => SignIn()));
                          })),
                    ]),
              )
            ],
          ),
        ));
  }
}
