import 'package:firebase_signin/appointmentpages/add_student_page.dart';
import 'package:firebase_signin/appointmentpages/list_student_page.dart';
import 'package:firebase_signin/screens/home_screen.dart';
import 'package:flutter/material.dart';


class appointmentHomePage extends StatefulWidget {
  appointmentHomePage({Key? key}) : super(key: key);

  @override
  _appointmentHomePageState createState() => _appointmentHomePageState();
}

class _appointmentHomePageState extends State<appointmentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen())); },
              ),
            Text('Appointments'),
            // ElevatedButton(
            //   onPressed: () => {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => AddStudentPage(),
            //       ),
            //     )
            //   },
                 IconButton(
                    icon: Icon(Icons.add_task_rounded),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStudentPage())); },
                        ),
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}