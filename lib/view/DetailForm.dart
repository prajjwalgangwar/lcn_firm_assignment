import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lcn_firm_assignment/controller/serviceAPI.dart';
import 'package:lcn_firm_assignment/utilities/colors.dart';
import 'package:lcn_firm_assignment/view/AvailableServices.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:lcn_firm_assignment/controller/validators.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:intl/intl.dart';

class DetailForm extends StatefulWidget{
  @override
  DetailFormState createState() => DetailFormState();
}
class DetailFormState extends State<DetailForm> with InputValidationMixin {

  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1905),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        dob='';
        dob+=(currentDate.day<=9 ? '0'+currentDate.day.toString(): currentDate.day.toString())+'/';
        dob+=(currentDate.month<=9 ? '0'+currentDate.month.toString(): currentDate.month.toString())+'/';
        dob+=currentDate.year.toString();
        print('dob ata temp is $dob');
        currentDate = pickedDate;
      });
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController cpController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String user_status = 'active';
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? gender;
  String dob='';
  PickedFile? image;

  postFormData() async{
    var response = http.post(Uri.parse('uri'), body: {
      'image' : name,
      'name' : name,
      'email' : email,
      'password' : password,
      'gender' : gender,
      'dob' : dob
    });
  }

  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;

  bool formStatus(){

    return false;
  }
  void _saveForm() {
    setState(() {
      _isValid = _formKey.currentState!.validate();
    });
  }


  bool _value = false;
  var val = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.transparent,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InkWell(
              onTap: ()async{
                await ImagePicker.platform.pickImage(source: ImageSource.gallery).then((value) => image=value);
                setState(() {

                });
              },
              child: image == null ? DottedBorder(
                  dashPattern: [3, 4],
                  strokeWidth: 0.5,
                  child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_enhance_rounded,
                            size: 32,
                            color: Color(0xFF939393),
                            semanticLabel: 'Upload',
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Upload',
                              style: TextStyle(color: Color(0xFF939393), fontSize: 12),
                            ),
                          )
                        ],
                      ))) : Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                margin: EdgeInsets.all(10),
                child: Image.file(File(image!.path)),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     image: DecorationImage(
                //         image: ima,
                //     )
                // ),
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: TextFormField(
                controller: nameController,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                onChanged: (value) {
                  name = value;
                },
                validator: (value){
                  if(isNameValid(value)) return null;
                  return 'Enter Valid Name';
                },
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                    const BorderSide(color: Color(0xFF939393), width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xFFE45171), width: 0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Full Name",
                  hintStyle: TextStyle(
                    color: Color(0xFF939393),
                    fontSize: 14,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: TextFormField(
                // inputFormatters : [
                //   FilteringTextInputFormatter.allow(RegExp(r'[a-z]')),
                // ],
                controller: emailController,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                        isEmailValid(value) == true ? 'Enter Valid Email' : null;
                },
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                    const BorderSide(color: Color(0xFF939393), width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xFFE45171), width: 0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Email ID",
                  hintStyle: TextStyle(
                    color: Color(0xFF939393),
                    fontSize: 14,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),


                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: TextFormField(
                controller: passwordController,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (isPasswordValid(value)) return null;
                  return 'Password must be 6+ characters';
                },
                cursorHeight: 21,
                cursorColor: Color(0xFF111111),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color(0xFF939393),
                    size: 19,
                  ),
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                    const BorderSide(color: Color(0xFF939393), width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xFFE45171), width: 0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Create Password",
                  hintStyle: TextStyle(
                    color: Color(0xFF939393),
                    fontSize: 14,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: TextFormField(
                controller: cpController,
                obscureText: true,
                obscuringCharacter: '*',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                onChanged: (value) {
                  confirmPassword = value;
                },
                validator: (value){
                  if( value == passwordController.text ) return null;
                  return 'password don\'t match';
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.visibility_off_outlined,
                    color: Color(0xFF939393),
                    size: 19,
                  ),
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                    const BorderSide(color: Color(0xFF939393), width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xFFE45171), width: 0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(
                    color: Color(0xFF939393),
                    fontSize: 14,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: DropdownButtonFormField(
                  hint: Text('Select Gender', style: TextStyle(color: Color(0xFF939393), fontSize: 14),),
                  itemHeight: 48,
                  dropdownColor: Colors.white,
                  value: gender,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                      const BorderSide(color: Color(0xFF939393), width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Color(0xFFE45171), width: 0.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                  items: [
                    DropdownMenuItem(child: Text("Male", style: TextStyle(fontSize: 14),), value: "Male"),
                    DropdownMenuItem(child: Text("Female",  style: TextStyle(fontSize: 14),), value: "Female"),
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: InkWell(
                onTap: (){
                  _selectDate(context);
                },
                child: IgnorePointer(
                  child: TextFormField(
                    controller: dobController,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    onChanged: (value) {
                    },
                    validator: (value){
                    },
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: (){
                          _selectDate(context);
                          print('select date');
                        },
                        child: Icon(
                          Icons.calendar_today,
                          color: Color(0xFF939393),
                          size: 19,
                        ),
                      ),
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                        const BorderSide(color: Color(0xFF939393), width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFE45171), width: 0.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,
                      hintText: dob.length <= 0 ?"Date of Birth":dob,
                      hintStyle: TextStyle(
                        color: Color(0xFF939393),
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  child: Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value as int;
                        user_status = 'Active';
                      });
                    },
                    activeColor: Color(0xFFE45171),
                  ),
                ),
                Container(
                  child: Text('Active'),
                ),
                SizedBox(width: 40,),
                Container(
                  child: Radio(
                    toggleable: true,
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value as int;
                        user_status = 'Suspended';
                      });
                    },
                    activeColor: Color(0xFFE45171),
                  ),
                ),
                Container(
                  child: Text('Suspended'),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1D2677),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.transparent))),
                onPressed: () async {

                  _saveForm();
                  var statusCode = await HttpService().submitUserDetails(image, name, email, password, gender, dob, user_status);

                  // emailController.clear();

                  print('status code = ${statusCode.runtimeType}');
                  statusCode == 200 ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved'))) : ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Nahi Karunga Save')));
                  // print('data of form: $name $email $password $confirmPassword $user_status ${currentDate.day}/${currentDate.month}/${currentDate.year}');
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
