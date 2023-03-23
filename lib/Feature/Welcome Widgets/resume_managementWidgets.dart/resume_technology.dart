import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResumeTechnology extends StatefulWidget {
  @override
  _ResumeTechnologyState createState() => _ResumeTechnologyState();
}

class _ResumeTechnologyState extends State<ResumeTechnology> {
  final _formKey = GlobalKey<FormState>();

  String _responsibility = '';
  String _technology = '';
  String _created = '';
  String _updated = '';
  String _proficiency = '';

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
                  labelText: 'Technology',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter technology';
                  }
                  return null;
                },
                onSaved: (value) {
                  _technology = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Proficiency level',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'level of proficiency';
                  }
                  return null;
                },
                onSaved: (value) {
                  _proficiency = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Time Created',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Created';
                  }
                  return null;
                },
                onSaved: (value) {
                  _created = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Time Update',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Updated';
                  }
                  return null;
                },
                onSaved: (value) {
                  _updated = value!;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
