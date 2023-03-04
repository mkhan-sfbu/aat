import 'package:flutter/material.dart';
import '../section_widgets/quiz_management.dart';

class QuestionManagement extends StatefulWidget {
  const QuestionManagement({key}) : super(key: key);

  @override
  _QuestionManagementState createState() => _QuestionManagementState();
}

class _QuestionManagementState extends State<QuestionManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 5, 1, 3),
            child: Text(
              "Company Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 280,
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(3, 5, 1, 3),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),

          SizedBox(
            height: 90,
            width: 280,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Resume Management",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20),

          SizedBox(
            height: 90,
            width: 280,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Question Management",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20),

          SizedBox(
            height: 90,
            width: 280,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "QUIZ Management",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),

          SizedBox(height: 20),
          Text(
            "Row 6",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ()));
              },
              child: Text("Next"),
            ),
          ]),
        ],
      ),
    );
  }
}
