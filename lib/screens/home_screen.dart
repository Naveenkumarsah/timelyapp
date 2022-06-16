
import 'package:firebase_signin/appointmentpages/add_student_page.dart';
import 'package:firebase_signin/appointmentpages/list_student_page.dart';
import 'package:firebase_signin/provider/navigation_provider.dart';
import 'package:firebase_signin/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timely',
      theme: ThemeData(primarySwatch: Colors.cyan),

      home: const Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  bool isLoading = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('    Appointments     '),
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
