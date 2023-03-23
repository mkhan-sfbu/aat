import '../resume_managementWidgets.dart/resume_technology.dart';
import '../resume_managementWidgets.dart/resume_project.dart';
import 'package:flutter/material.dart';
import '../section_widgets/quiz_management.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResumeManagement extends StatefulWidget {
  const ResumeManagement({Key? key}) : super(key: key);

  @override
  _ResumeManagementState createState() => _ResumeManagementState();
}

class _ResumeManagementState extends State<ResumeManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 70,
              // ignore: prefer_const_constructors
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s',
                // ignore: prefer_const_constructors
                style: TextStyle(
                    // ignore: prefer_const_constructors
                    color: Color.fromARGB(179, 10, 11, 10),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumeProject(),
                  ),
                );
              },
              // ignore: prefer_const_constructors
              child: Text(
                'Go Resume Project Page',
                // ignore: prefer_const_constructors
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 70,
              // ignore: prefer_const_constructors
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s',
                // ignore: prefer_const_constructors
                style: TextStyle(
                    // ignore: prefer_const_constructors
                    color: Color.fromARGB(179, 10, 11, 10),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumeTechnology(),
                  ),
                );
              },
              // ignore: prefer_const_constructors
              child: Text(
                'Go to Resume Technology Page',
                // ignore: prefer_const_constructors
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
