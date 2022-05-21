import 'package:flutter/material.dart';
import 'package:lcn_firm_assignment/utilities/colors.dart';
class Services extends StatefulWidget {
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
            margin: EdgeInsets.only(top: 16, left: 16),
            child: ListView.builder(
              itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 92,
                height: 92,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                    color: Color(0xFFFAA33F),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      width: 50,
                      margin: const EdgeInsets.only(bottom: 13.25, top: 11, left: 21, right: 21),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(8),
                          // image: const DecorationImage(
                          //     image: NetworkImage('assets/makeup@2x.png'))
                            ),
                    ),
                    Text('Women Beautician', style: TextStyle(fontSize: 9, color: Colors.white),)
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