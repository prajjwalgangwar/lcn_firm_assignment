import 'package:flutter/material.dart';
import 'package:lcn_firm_assignment/controller/serviceAPI.dart';
import 'package:lcn_firm_assignment/utilities/colors.dart';

import '../model/service_model.dart';
class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  ServicesState createState() => ServicesState();
}

class ServicesState extends State<Services> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const SizedBox(
          height: 40,
          child: ListTile(
            title: Text(
              'Services',
              style: TextStyle(
                  color: CustomColors.textPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              'View all',
              style: TextStyle(color: CustomColors.textPrimaryColor),
            ),
          ),
        ),
        Container(
            height: 92,
            margin: const EdgeInsets.only(top: 16, left: 16),
            child: ListView.builder(
              itemCount: servicesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              ServicesModel service=servicesList.elementAt(index) as ServicesModel;
              print('services length ${service.name}');
              return Container(
                width: 92,
                height: 92,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                    color: Color(int.parse(service.bgcolor!)),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      width: 50,
                      margin: const EdgeInsets.only(bottom: 13.25, top: 11, left: 21, right: 21),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(service.icon!))
                            ),
                    ),
                    Text(service.name, style: TextStyle(fontSize: 9, color: Colors.white),)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}