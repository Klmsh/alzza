import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "dart:ui" as ui;

import '../main.dart';
import '../style/alzza_https.dart';
import '../style/styles.dart';
import '../widgets/Widgets.dart';

class Tab2_Screen extends StatefulWidget {
  const Tab2_Screen({Key? key}) : super(key: key);

  @override
  State<Tab2_Screen> createState() => _Tab2_ScreenState();
}

class _Tab2_ScreenState extends State<Tab2_Screen> {

  late Timer _timer;
  var _time = 0;
  late AppHttps appHttps;
  late String points;
  var f = NumberFormat('###,###,###,###');

  @override
  void initState() {
    super.initState();
    points = f.format(double.parse(MainActivity.list_data[1]));
    appHttps = AppHttps();
    _start();
  }

  void _start() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      await appHttps.getUserData();
      setState(() {
        points = f.format(double.parse(MainActivity.list_data[1]));
        _time++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.menu, color:Colors.black,),
            iconSize: 24,
            onPressed: () {
              _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
            },
          ),

          title: const Text("포인트",style: TextStyle(
            color: Colors.black,
            fontFamily: "Noto",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),),

          actions: [
            Container(
              margin: const EdgeInsets.only(right: 2),
              child: IconButton(
                icon: const Icon(Icons.notifications_active_outlined, color:Colors.black,),
                iconSize: 24,
                onPressed: () {
                  _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                },
              ),
            )
          ],
        ),
        body: SafeArea(child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0)),
                    color: greyColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("추석 쿠폰 혜택", style: TextStyle(
                            fontFamily: "Noto",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black
                        )),
                        SizedBox(height: 4,),
                        Text("~ 9월 12일", style: TextStyle(
                            fontFamily: "Noto",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black45
                        )),
                      ],
                    ),

                   GestureDetector(
                     child:  Container(
                       padding: const EdgeInsets.only(top: 10, bottom: 11, left: 16, right: 16),
                       decoration: const BoxDecoration(
                           borderRadius: BorderRadius.only(
                               bottomLeft: Radius.circular(8.0),
                               topLeft: Radius.circular(8.0),
                               topRight: Radius.circular(8.0),
                               bottomRight: Radius.circular(8.0)),
                           color: Colors.indigo
                       ),
                       child: const Text("쿠폰받기",style: TextStyle(
                           fontFamily: "Noto",
                           fontWeight: FontWeight.bold,
                           fontSize: 13,
                           letterSpacing: 3,
                           color: Colors.white
                       )),
                     ),
                     onTap: (){
                       _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                     },
                   )
                  ],
                )
              ),

              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                margin: EdgeInsets.only(left: 16, right: 16,),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0)),
                    color: primary
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    const Text("사용가능 포인트", style: TextStyle(
                        fontFamily: "Noto",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white
                    ),),

                    const SizedBox(height: 20,),

                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: tabTextStyle4444(Colors.white),
                          children: [
                            WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15,right: 0,bottom: 0),
                                child: Text(
                                    points,
                                    style: const TextStyle(
                                        fontFamily: "Noto",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color: Colors.white
                                    )
                                ),
                              ),
                            ),
                            const WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.only(left: 0,right: 0,bottom: 0, top: 4),
                                child: Text(
                                    "P",
                                    style: TextStyle(
                                        fontFamily: "Noto",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),



                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: SizedBox(
                            width: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_circle_outline, color: Colors.white, size: 40,),
                                Padding(padding: EdgeInsets.only(bottom: 8),
                                  child: Text("충전", style: TextStyle(
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white
                                  )
                                  ),),
                              ],
                            ),
                          ),
                          onTap: (){
                            _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                          },
                        ),
                        GestureDetector(
                          child: SizedBox(
                            width: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.change_circle_outlined, color: Colors.white, size: 40,),
                                Padding(padding: EdgeInsets.only(bottom: 8),
                                  child: Text("전환", style: TextStyle(
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white
                                  )
                                  ),),
                              ],
                            ),
                          ),
                          onTap: (){
                            _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                          },
                        ),
                        GestureDetector(
                          child: SizedBox(
                            width: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.note_outlined, color: Colors.white, size: 40,),
                                Padding(padding: EdgeInsets.only(bottom: 8),
                                  child: Text("내역", style: TextStyle(
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white
                                  )
                                  ),),
                              ],
                            ),
                          ),
                          onTap: (){
                            _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                          },
                        ),
                        GestureDetector(
                          child: SizedBox(
                            width: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.wallet_giftcard_rounded, color: Colors.white, size: 40,),
                                Padding(padding: EdgeInsets.only(bottom: 8),
                                  child: Text("선물", style: TextStyle(
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white
                                  )
                                  ),),
                              ],
                            ),
                          ),
                          onTap: (){
                            _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                          },
                        )
                    ],),

                  ],
                ),
              ),

              const SizedBox(height: 10,),

              Container(
                  margin: const EdgeInsets.only(right: 16,left: 16),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0)),
                      color: Colors.deepPurple

                  ),
                  child:
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("MY 등급", style: TextStyle(
                              fontFamily: "Noto",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1,
                              color: Colors.white
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage(
                                "lib/assets/icons/diamond.png",
                              ),
                                width: 30,),
                              Text("  DIAMOND", style: TextStyle(
                                  fontFamily: "Noto",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  color: Colors.white
                              ),),
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                    },
                  )
              ),

              const SizedBox(height: 16,),

              GestureDetector(
                child: Container(
                    margin: const EdgeInsets.only(right: 16,left: 16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                        color: Color(0xff5289E3)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("매일 출석체크해서", style: TextStyle(
                                  fontFamily: "Noto",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 4,
                                  color: Colors.white
                              ),),
                              Text("포인트를 받자!", style: TextStyle(
                                  fontFamily: "Noto",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 4,
                                  color: Colors.white
                              ),),
                              SizedBox(height: 20,),
                              Text("출석체크!!", style: TextStyle(
                                  fontFamily: "Aggro",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  letterSpacing: 4,
                                  color: Colors.white
                              ),),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            height: 120,
                            width: 120,
                            child: const Image(image: AssetImage("lib/assets/icons/asd.jpg"),width: 120, height: 120, fit: BoxFit.fill,),
                          )
                        ],
                      ),
                    )
                ),
                onTap: (){
                  _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                },
              ),



              const SizedBox(height: 16,),

              GestureDetector(
                child: Container(
                    margin: const EdgeInsets.only(right: 16,left: 16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                        color: Color(0xff5289E3)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "lib/assets/icons/benu.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    )

                ),
                onTap: (){
                  _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                },
              ),


              const SizedBox(height: 16,),

            ],
          ),
        )
        )
    );
  }
}


void _showDialog(context, title, subtitle) {

  showDioalogCustom(context, title, subtitle);

}



// Column(
//
//               children: [
//                 Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 16),child:
//                 Container(
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(8.0),
//                           topLeft: Radius.circular(8.0),
//                           topRight: Radius.circular(8.0),
//                           bottomRight: Radius.circular(8.0)),
//                       color: primary
//                   ),
//                   child: Stack(
//                     children: [
//                       Align(
//
//                           alignment: Alignment.topLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 16, top: 10),
//                             child:
//                             RichText(
//                                 textAlign: TextAlign.center,
//                                 text: TextSpan(
//                                   style: const TextStyle(
//                                       fontFamily: "Noto",
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: Colors.white
//                                   ),
//                                   children: [
//                                     TextSpan(
//                                       text: MainActivity.list_data[0],
//                                     ),
//                                     const WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
//                                       child: SizedBox(width: 4,),
//                                     ),
//                                     TextSpan(
//                                         text: "님의 보유 포인트", style: tabTextStyle3333(Colors.white)
//                                     ),
//                                   ],
//                                 )
//                             ),
//                           )
//                       ),
//
//                       Align(
//                           alignment: Alignment.center,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//
//                               const Text("사용가능 포인트", style: TextStyle(
//                                   fontFamily: "Noto",
//                                   fontWeight: FontWeight.normal,
//                                   fontSize: 13,
//                                   color: Colors.white
//                               ),),
//
//                               RichText(
//                                 textAlign: TextAlign.center,
//                                 text: TextSpan(
//                                   style: tabTextStyle4444(Colors.white),
//                                   children: [
//                                     WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(left: 4,right: 4,bottom: 16),
//                                         child: Text(
//                                           points,
//                                           style: tabTextStyle4444(Colors.white),
//                                         ),
//                                       ),
//                                     ),
//
//                                     WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(left: 0,right: 4,bottom: 8),
//                                         child: Text(
//                                             "P",
//                                             style: tabTextStyle5555(Colors.white)
//                                         ),
//                                       ),
//                                     ),
//
//
//                                   ],
//                                 ),
//                               )
//                             ],
//                           )
//
//                       ),
//
//                       Row(
//                         children: [
//                           Flexible(flex: 1,child:
//                           GestureDetector(
//                             child: Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: AspectRatio(
//                                   aspectRatio: 3.5/1,
//                                   child: Container(
//                                     margin: const EdgeInsets.only(bottom: 16,right: 8, left: 16),
//                                     decoration: BoxDecoration(
//                                       borderRadius: const BorderRadius.only(
//                                           bottomLeft: Radius.circular(8.0),
//                                           topLeft: Radius.circular(8.0),
//                                           topRight: Radius.circular(8.0),
//                                           bottomRight: Radius.circular(8.0)),
//                                       color: Colors.white.withOpacity(0.4),
//                                     ),
//                                     child: Center(
//                                       child: Text("충전하기", style: tabTextStyle6666(Colors.white),),
//                                     ),
//                                   ),
//                                 )
//                             ),
//                             onTap: (){
//                               _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
//                             },
//                           ),),
//                           Flexible(flex: 1,child:
//                           GestureDetector(
//                             child: Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: AspectRatio(
//                                   aspectRatio: 3.5/1,
//                                   child: Container(
//                                     margin: const EdgeInsets.only(bottom: 16,right: 16, left: 8),
//                                     decoration: BoxDecoration(
//                                       borderRadius: const BorderRadius.only(
//                                           bottomLeft: Radius.circular(8.0),
//                                           topLeft: Radius.circular(8.0),
//                                           topRight: Radius.circular(8.0),
//                                           bottomRight: Radius.circular(8.0)),
//                                       color: Colors.white.withOpacity(0.4),
//                                     ),
//                                     child: Center(
//                                       child: Text("적립내역", style: tabTextStyle6666(Colors.white),),
//                                     ),
//                                   ),
//                                 )
//                             ),
//                             onTap: (){
//                               _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
//                             },
//                           ),)
//                         ],
//                       )
//                     ],
//                   ),
//                 ),),
//
//                 Container(
//                     width: double.infinity,
//                     margin: const EdgeInsets.only(right: 18, bottom: 32),
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: Text("1포인트는 1원의 현금 가치를 갖고 있습니다.", style: bottomMenuTextStyle(),),
//                     )
//                 ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//
//                    GestureDetector(
//                      child:  Column(
//                        children: [
//                          Container(
//                            width: 50,
//                            height: 50,
//                            child: Image(image: AssetImage('lib/assets/icons/user.png'),fit: BoxFit.fill,),
//                            margin: EdgeInsets.only(bottom: 4),
//                          ),
//                          Center(
//                            child: Text("My머니", style: tabTextStyle(blacktext),),
//                          )
//                        ],
//                      ),
//                      onTap: (){
//                        _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
//                      },
//                    ),
//
//                     GestureDetector(
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 50,
//                             height: 50,
//                             child: Image(image: AssetImage('lib/assets/icons/exchange.png'),fit: BoxFit.fill,),
//                             margin: EdgeInsets.only(bottom: 4),
//                           ),
//                           Center(
//                             child: Text("충전", style: tabTextStyle(blacktext),),
//                           )
//                         ],
//                       ),
//                       onTap: (){
//                         _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
//                       },
//                     ),
//
//                     GestureDetector(
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 50,
//                             height: 50,
//                             child: Image(image: AssetImage('lib/assets/icons/plugin.png'),fit: BoxFit.fill,),
//                             margin: EdgeInsets.only(bottom: 4),
//                           ),
//                           Center(
//                             child: Text("전환", style: tabTextStyle(blacktext),),
//                           )
//                         ],
//                       ),
//                       onTap: (){
//                         _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
//                       },
//                     ),
//
//                     GestureDetector(
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 50,
//                             height: 50,
//                             child: Image(image: AssetImage('lib/assets/icons/gift-box.png'),fit: BoxFit.fill,),
//                             margin: EdgeInsets.only(bottom: 4),
//                           ),
//                           Center(
//                             child: Text("선물", style: tabTextStyle(blacktext),),
//                           )
//                         ],
//                       ),
//                       onTap: () {
//                         _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
//                       },
//                     )
//                   ],
//                 )
//
//               ],
//             )