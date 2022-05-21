// import 'package:lcn_firm_assignment/model/service_model.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:core';
//
// class HttpService {
//   final String postsURL = "https://jsonplaceholder.typicode.com/posts";
//
//   Future<List<AvailableServices>> getPosts() async {
//     Response res = await get(postsURL);
//
//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);
//
//       List<Post> posts = body
//           .map(
//             (dynamic item) => AvailableServices.fromJson(item),
//       ).toList();
//
//       return posts;
//     } else {
//       throw "Unable to retrieve services.";
//     }
//   }
// }