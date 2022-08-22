import 'package:flutter/material.dart';
import "dart:ui" as ui;

import '../../style/styles.dart';

class Tab3_Map_Item extends StatefulWidget {

  final double id;
  final String Company;
  final String Title;
  final String Payment;
  final String Area;
  final String date;
  final bool isAlbar;

  Tab3_Map_Item({
    Key? key,
    required this.id,
    required this.Company,
    required this.Title,
    required this.Payment,
    required this.Area,
    required this.date,
    required this.isAlbar,
  }) : super(key: key);

  @override
  _Tab3_Map_ItemState createState() => _Tab3_Map_ItemState();
}

class _Tab3_Map_ItemState extends State<Tab3_Map_Item> {

  String today_date = "";
  bool isReady = false;
  double appWidth = 0;

  @override
  void initState() {
    super.initState();
    appWidth = widget.id.floor() - 210;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        elevation: 1,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: 150,
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),

                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(image: AssetImage("lib/assets/logos/alzza_simbol.png"),fit: BoxFit.fill,),
                )

            ),

            Padding(padding: EdgeInsets.only(top: 16,right: 16),child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: appWidth - 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  const [
                      Text("백스코 제1전시장 1~2A홀",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Noto",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),

                      Icon(Icons.star, color:primary, size: 18,),
                    ],
                  ),
                ),

                SizedBox(height: 4,),

                RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white
                      ),
                      children: [

                        WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                          child: Icon(Icons.location_on, color:Colors.black, size: 14,),
                        ),



                        WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                          child: Padding(padding: EdgeInsets.only(bottom: 2,left: 4),
                              child: Text(
                                "부산광역시 해운대구 APEC로 55", style: TextStyle(
                                  fontFamily: "Noto",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.black
                              ),)
                          ),
                        ),

                      ],
                    )
                ),

                RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white
                      ),
                      children: [

                        WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                            child: Padding(padding: EdgeInsets.only(left: 0),
                              child: Icon(Icons.battery_3_bar_rounded, color:Colors.yellow, size: 14,),)
                        ),

                        WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                          child: Padding(padding: EdgeInsets.only(bottom: 0,left: 4),
                              child: Text(
                                "47%", style: TextStyle(
                                  fontFamily: "Noto",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.black
                              ),)
                          ),
                        ),

                        WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                            child: Padding(padding: EdgeInsets.only(left: 8,top: 1),
                              child: Icon(Icons.circle, color:Colors.green, size: 12,),)
                        ),

                        WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                          child: Padding(padding: EdgeInsets.only(top: 0,left: 4),
                              child: Text(
                                "사용가능", style: TextStyle(
                                  fontFamily: "Noto",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.black
                              ),)
                          ),
                        ),

                      ],
                    )
                ),

                SizedBox(height: 14,),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 1.0,
                      color: Colors.black45
                    ),
                  ),
                  height: 30,
                  width: appWidth,
                  child: const Center(
                    child: Text("A/S 문의",
                    style: TextStyle(
                      fontFamily: "Noto",
                      fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black,

                    ),
                    ),
                  ),
                )


              ],
            ),)
          ],
        )
      ),
    );
  }
}