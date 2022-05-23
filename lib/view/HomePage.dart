import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lcn_firm_assignment/utilities/colors.dart';
import 'package:lcn_firm_assignment/view/AvailableServices.dart';
import 'package:lcn_firm_assignment/view/DetailForm.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

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
          HighestRated(),
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

class HighestRated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const SizedBox(
          height: 40,
          child: ListTile(
            title: Text(
              'Highest Rated',
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
          height: 190,
          margin: EdgeInsets.only(top: 16, bottom: 32),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                width: 207,
                margin: const EdgeInsets.only(left: 12, right: 6, ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color(0xFF939393),
                        width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Container(
                      height: 108,
                      width: 191,
                      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(8),
                        image:const DecorationImage(
                          image: AssetImage('assets/images/makeup.png')
                        )
                      ),
                      // child: Image.asset('assets/images/1.png'),
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8, top: 8),
                          child: Text(
                            'Salon Name',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF444242)),
                          ),
                        )),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'Near Location name',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 10, color: Color(0xFF939393)),
                          ),
                        )),
                    Container(
                      child: Row(
                        children:[
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(top: 4, left: 8),
                              child: RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                itemSize: 12,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 4,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Color(0xFFF29A4E),
                                ),
                                onRatingUpdate: (rating) {
                                },
                              ),
                            )
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined, size: 12.04, color: Color(0xFF939393)),
                                  Text('2 Mile',textAlign: TextAlign.end, style: TextStyle(fontSize: 10, color: Color(0xFF939393)),)
                                ],
                              ),
                            ),
                          )
                        ]

                      ),
                    )
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


