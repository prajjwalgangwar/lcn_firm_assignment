import 'package:dotted_border/dotted_border.dart';
import 'package:download_assets/download_assets.dart';
import 'package:flutter/material.dart';
import 'package:lcn_firm_assignment/utilities/colors.dart';
import 'package:lcn_firm_assignment/view/AvailableServices.dart';
import 'package:lcn_firm_assignment/view/DetailForm.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

import 'HighestRated.dart';

class LandingPage extends StatefulWidget {
  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  static int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('++++++++++++++++++++++ launching Landing Page ++++++++++++++++++++++++++++');
    return SafeArea(
      child: Scaffold(
        drawerScrimColor: Colors.transparent,
        backgroundColor: Colors.red[50],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            selectedItemColor: Colors.red[900],
            unselectedItemColor: Colors.black38,
            selectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedFontSize: 10,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: Icon(Icons.home),
                ),
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: Icon(Icons.calendar_today_outlined),
                ),
                icon: Icon(Icons.calendar_today_outlined),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: Icon(Icons.location_on),
                ),
                icon: Icon(Icons.location_on),
                label: 'Nearby',
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: Icon(Icons.message_outlined),
                ),
                icon: Icon(Icons.message_outlined),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: Icon(Icons.person_outline),
                ),
                icon: Icon(Icons.person_outline),
                label: 'Account',
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: [
            HomePage(),
            HomePage(),
            HomePage(),
            HomePage(),
            HomePage(),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          CustomAppBar(),
          HisgestRated(),
          Services(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Divider(
              thickness: 2,
            ),
          ),
          DetailForm()
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFE45171),
        Color(0xFFA861BD),
        Color(0xFF1A3263),
      ])),
      child: SizedBox(
        height: 130,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFE45171),
            Color(0xFFA861BD),
            Color(0xFF1A3263),
          ])),
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Container(
                  color: Colors.transparent,
                  child: const ListTile(
                    title:
                        Text('LCN FIRM', style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 16,
                    ),
                  )),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Pikashi jain',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 12,
                    ),
                    Text('Time Square Plaza, New York',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Poppins')),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                      size: 16,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


