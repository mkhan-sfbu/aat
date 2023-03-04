import 'package:flutter/material.dart';
import '../reusesablewidget/reusesablewidget.dart';
import 'signup.dart';
import 'welcome.dart';
import './reset_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
// }
// class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color.fromARGB(255, 186, 178, 178)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/project_logo.png"),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.person_outline, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                forgetPassword(context),
                signInsignUpButton(context, "LOG IN", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResetPassword()));
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.center,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
              color: Color.fromARGB(179, 10, 11, 10),
              fontWeight: FontWeight.bold,
              fontSize: 18),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Welcome())),
      ),
    );
  }
}
