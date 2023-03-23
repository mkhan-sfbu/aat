// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';

class QuizManagement extends StatefulWidget {
  const QuizManagement({key}) : super(key: key);

  @override
  _QuizManagementState createState() => _QuizManagementState();
}

class _QuizManagementState extends State<QuizManagement> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _type = '';

  static const List<String> list = <String>[
    'Completed',
    'Pending',
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Do something with the form data, e.g. submit to server or save to local storage

      ScaffoldMessenger.of(context).showSnackBar(
        // ignore: prefer_const_constructors
        SnackBar(
          // ignore: prefer_const_constructors
          content: Text('Form submitted'),
        ),
      );
    }
  }

  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Quiz Title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'Type',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Quiz Type';
                  }
                  return null;
                },
                onSaved: (value) {
                  _type = value!;
                },
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                isExpanded: true,
                iconSize: 30,
                style: const TextStyle(color: Colors.blueAccent),
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
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Date Created',
                          style:
                              TextStyle(color: Colors.blue[400], fontSize: 20)),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      _dateTime.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: MaterialButton(
                      onPressed: _showDatePicker,
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Choose Date',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      color: Colors.blue[400],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(
                        'Save',
                        // ignore: prefer_const_constructors
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
