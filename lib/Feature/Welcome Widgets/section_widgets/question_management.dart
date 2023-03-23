// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionManagement extends StatefulWidget {
  const QuestionManagement({key}) : super(key: key);

  @override
  _QuestionManagementState createState() => _QuestionManagementState();
}

final _formKey = GlobalKey<FormState>();

String _inputText = '';
String _searchText = '';

class _QuestionManagementState extends State<QuestionManagement> {
  static const List<String> list = <String>['Easy', 'Medium', 'Hard'];
  String dropdownValue = list.first;

  get isEditing => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.all(90.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            contentPadding:
                                // ignore: prefer_const_constructors
                                EdgeInsets.symmetric(horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            // ignore: prefer_const_constructors
                            suffixIcon: Icon(Icons.search),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _searchText = value;
                            });
                          },
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration:
                                    // ignore: prefer_const_constructors
                                    InputDecoration(labelText: 'Add Questions'),
                                initialValue: _inputText,
                                enabled: isEditing,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                decoration:
                                    // ignore: prefer_const_constructors
                                    InputDecoration(labelText: 'Question Type'),
                                initialValue: _inputText,
                                enabled: isEditing,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                decoration:
                                    // ignore: prefer_const_constructors
                                    InputDecoration(labelText: 'Technology'),
                                initialValue: _inputText,
                                enabled: isEditing,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                isExpanded: true,
                                iconSize: 30,
                                style:
                                    const TextStyle(color: Colors.blueAccent),
                                underline: Container(
                                  height: 2,
                                  color: Colors.blue,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              // ignore: prefer_const_constructors
                              child: Text('Edit'),
                              onPressed: () {
                                setState(() {
                                  // Enable editing of the form data
                                });
                              },
                            ),
                            ElevatedButton(
                              // ignore: prefer_const_constructors
                              child: Text('Save'),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  setState(() {
                                    // Save the form data
                                  });
                                }
                              },
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              // ignore: prefer_const_constructors
                              child: Text('Delete'),
                              onPressed: () {
                                setState(() {
                                  // Delete the form data
                                });
                              },
                            ),
                          ],
                        ),
                      ])),
              Container(
                // padding: EdgeInsets.all(16.0), // Add padding to the container
                color: Colors.green[100],
                // ignore: prefer_const_constructors
                padding: EdgeInsets.all(
                    90.0), // Set the background color of the container
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align the text to the left
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      'Question 1',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 8.0), // Add some vertical spacing
                    // ignore: prefer_const_constructors
                    Text(
                      'What is your name?',
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontSize: 16.0),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 16.0), // Add more vertical spacing
                    // ignore: prefer_const_constructors
                    Text(
                      'Question 2',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 8.0),
                    // ignore: prefer_const_constructors
                    Text(
                      'What is your favorite color?',
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
