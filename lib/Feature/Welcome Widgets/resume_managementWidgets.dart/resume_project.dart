import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResumeProject extends StatefulWidget {
  @override
  _ResumeProjectState createState() => _ResumeProjectState();
}

class _ResumeProjectState extends State<ResumeProject> {
  final _formKey = GlobalKey<FormState>();

  String _responsibility = '';
  String _title = '';
  String _start = '';
  String _end = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Do something with the form data, e.g. submit to server or save to local storage

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Form submitted'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Responsibility Detail',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the Required Responsibility';
                  }
                  return null;
                },
                onSaved: (value) {
                  _responsibility = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Start Time',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'start time added';
                  }
                  return null;
                },
                onSaved: (value) {
                  _start = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter End Time',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'end time added';
                  }
                  return null;
                },
                onSaved: (value) {
                  _end = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
