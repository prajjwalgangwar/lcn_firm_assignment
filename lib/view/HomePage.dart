import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lcn_firm_assignment/view/AvailableServices.dart';
import 'package:lcn_firm_assignment/view/DetailForm.dart';

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
          decoration: const BoxDecoration(
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
                    return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: const Icon(Icons.home),
                ),
                icon: const Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: const Icon(Icons.calendar_today_outlined),
                ),
                icon: const Icon(Icons.calendar_today_outlined),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: const Icon(Icons.location_on),
                ),
                icon: const Icon(Icons.location_on),
                label: 'Nearby',
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: const Icon(Icons.message_outlined),
                ),
                icon: const Icon(Icons.message_outlined),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A3263),
                          Color(0xFFA861BD),
                          Color(0xFFE45171),
                        ]
                    ).createShader(bounds);
                  },
                  child: const Icon(Icons.person_outline),
                ),
                icon: const Icon(Icons.person_outline),
                label: 'Account',
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: const [
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
          const CustomAppBar(),
          HisgestRated(),
          const Services(),
          const Padding(
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
    return SizedBox(
      height: 103,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFE45171),
          Color(0xFFA861BD),
          Color(0xFF1A3263),
        ])),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only( bottom: 18.63, left: 0, right: 60),
                        height: 11,
                        width: 125,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: CachedNetworkImageProvider('https://static.wixstatic.com/media/8dd88e_c75a8231824a48308c839acc1d6e3355~mv2.png/v1/fill/w_350,h_32,al_c,lg_1,q_85/lnc_logo.png')
                          )
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        color: Colors.transparent,
                        height: 16,
                          width: 13,
                          child:const Icon(Icons.notifications, color: Colors.white, size: 16,)),
                    )
                  ],
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(
                      'Pikashi jain',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  )),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 4.44),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text('Time Square Plaza, New York',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Poppins')),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.white,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


