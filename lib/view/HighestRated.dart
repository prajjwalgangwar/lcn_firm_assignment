
import 'package:download_assets/download_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utilities/colors.dart';

class HisgestRated extends StatefulWidget{
  @override
  HighestRatedState createState() => HighestRatedState();
}
class HighestRatedState extends State<HisgestRated> {
  DownloadAssetsController downloadAssetsController = DownloadAssetsController();
  String message = 'Press button to download';
  bool downloaded = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async{
    await downloadAssetsController.init();
    downloaded = await downloadAssetsController.assetsDirAlreadyExists();
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
                    InkWell(
                      onTap: (){},
                      onLongPress: (){},
                      child: Container(
                        height: 108,
                        width: 191,
                        margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                        decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Image.asset('assets/makeup.png'),
                      ),
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
