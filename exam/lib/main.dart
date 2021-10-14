import 'package:flutter/material.dart';
import './allPages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: MaterialApp(
        title: '',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/preopen",
        routes: {
          '/preopen': (context) => Preopen(),
          '/login': (context) => Login(),
          '/main': (context) => HomePage(),
          '/exam-info': (context) => ExamInfo(),
          '/examing': (context) => Examing(),
          '/exam-complete': (context) => ExamComplete(),
          '/question-answer': (context) => QuestionAnswer(),
        },
      ),
    );
  }
}
