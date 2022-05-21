import 'package:flutter/material.dart';
import 'package:lcn_firm_assignment/view/HomePage.dart';
import 'package:http/http.dart' as http;


void main() {
  await HttpService().fetchPostData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage()
    );
  }
}