
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_signin/appointmentpages/appointment_home_page.dart';
import 'package:flutter/material.dart';


class AppointmentPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Appointments',
            theme: ThemeData(
              primarySwatch: Colors.cyan,
            ),
            debugShowCheckedModeBanner: false,
            home: appointmentHomePage(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}