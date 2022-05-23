import 'package:flutter/material.dart';
import 'package:lcn_firm_assignment/view/HomePage.dart';
import 'package:http/http.dart' as http;
import 'package:lcn_firm_assignment/controller/serviceAPI.dart';
import 'package:lcn_firm_assignment/controller/controllers.dart';


void main() async {
  await HttpService().fetchPostData();
  // CategoriesController().categoriesList.length;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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