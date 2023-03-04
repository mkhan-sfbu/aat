import 'dart:convert';

import 'package:flutter/material.dart';
import '../reusesablewidget/reusesablewidget.dart';
import 'welcome.dart';
import 'package:http/http.dart';
import './reset_password.dart';

class SignUp extends StatefulWidget {
  const SignUp({key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
// }
  void login(String email, password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/users?page'), body: {
        'email': _emailTextController,
        'password': _passwordTextController,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("Account Created");
      } else {
        print("Failed!");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 186, 178, 178)),
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 100, 15, 0),
                      child: Column(
                        children: <Widget>[
                          logoWidget("assets/images/project_logo.png"),
                          SizedBox(
                            height: 20,
                          ),
                          reusableTextField("Enter Email", Icons.person_outline,
                              false, _emailTextController),
                          SizedBox(
                            height: 20,
                          ),
                          reusableTextField(
                              "Enter Password",
                              Icons.lock_outlined,
                              true,
                              _passwordTextController),
                          const SizedBox(
                            height: 20,
                          ),
                          forgetPassword(context),
                          signInsignUpButton(context, "SIGN UP", () {
                            onTap:
                            // ignore: unnecessary_statements
                            () {
                              login(_emailTextController.toString(),
                                  _passwordTextController.toString());
                            };
                            print("Created New Account");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Welcome()));
                          }),
                        ],
                      )))),
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
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
