import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lcn_firm_assignment/model/service_model.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

List servicesList=[];
class HttpService {
  final String _getUrl="https://anaajapp.com/api/categories";
  final String _postUrl="https://anaajapp.com/api/user/submit_details";
  StreamedResponse? response;

    fetchPostData() async
    {
      var jsonList=[];
      servicesList=[];
      await http.get(Uri.parse(_getUrl))
      .then((response) => jsonList=jsonDecode(response.body)['data']);
      for(var map in jsonList)
        {
          servicesList.add(ServicesModel.fromJson(map));
          // ServicesModel model=ServicesModel.fromJson(map);
          // print('list name is ${model.name}');
        }
    }
    Future<int> submitUserDetails(PickedFile? image, name, email, password, gender, dob, user_status)async
    {
      try{
        var multipartRequest=http.MultipartRequest('POST', Uri.parse(_postUrl));
        print('before response');
        multipartRequest.files.add(await http.MultipartFile.fromPath('image', image == null?'':image.path));
        print('after response');
        multipartRequest.fields['name']=name;
        multipartRequest.fields['email']=email;
        multipartRequest.fields['password']=password;
        multipartRequest.fields['gender']=gender;
        multipartRequest.fields['dob']=dob;
        multipartRequest.fields['user_status']=user_status;
        print('before response');
      response = await multipartRequest.send();
      print('after response');
    }catch(e){
        return 400;
      }
      return response!.statusCode;
    }
}