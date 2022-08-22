import 'dart:async';

import 'package:alzza/Tab_1/webView.dart';
import 'package:alzza/main.dart';
import 'package:alzza/style/alzza_https.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "dart:ui" as ui;
import '../style/splashItem.dart';
import '../style/styles.dart';
import 'package:intl/intl.dart';

import '../widgets/Widgets.dart';


class Tab1_Screen extends StatefulWidget {
  const Tab1_Screen({Key? key}) : super(key: key);

  @override
  _Tab1_ScreenState createState() => _Tab1_ScreenState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _Tab1_ScreenState extends State<Tab1_Screen> with TickerProviderStateMixin {

  bool isReady = true;
  late Timer _timer;
  var _time = 0;
  late ScrollController _ScrollController;
  late AppHttps appHttps;
  late String points;
  var f = NumberFormat('###,###,###,###');

  @override
  void initState() {
    super.initState();

    points = f.format(double.parse(MainActivity.list_data[1]));
    appHttps = AppHttps();
    _ScrollController = ScrollController();
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
          centerTitle: false,
          elevation: 1,

          title: const Image(image: AssetImage("lib/assets/logos/logo_alzza.png"), color: primary,width: 50,),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 2),
              child: IconButton(
                icon: const Icon(Icons.qr_code, color:primary,),
                iconSize: 24,
                onPressed: () {
                  _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                },
              ),
            )
          ],
        ),
        body: SafeArea(
            child:
            isReady ? SingleChildScrollView(
              controller: _ScrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 16),child:
                  AspectRatio(aspectRatio: 16/9,
                    child:Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0)),
                          color: primary
                      ),
                      child: Stack(
                        children: [
                          Align(

                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16, top: 10),
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: const TextStyle(
                                          fontFamily: "Noto",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white
                                      ),
                                      children: [
                                        TextSpan(
                                          text: MainActivity.list_data[0],
                                        ),
                                        const WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                                          child: SizedBox(width: 4,),
                                        ),
                                        TextSpan(
                                            text: "님의 보유 포인트", style: tabTextStyle3333(Colors.white)
                                        ),
                                      ],
                                    )
                                ),
                              )
                          ),

                          Align(
                              alignment: Alignment.center,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: tabTextStyle4444(Colors.white),
                                  children: [
                                    WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 4,right: 4,bottom: 16),
                                        child: Text(
                                          points,
                                          style: tabTextStyle4444(Colors.white),
                                        ),
                                      ),
                                    ),

                                    WidgetSpan(alignment: ui.PlaceholderAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0,right: 4,bottom: 8),
                                        child: Text(
                                            "P",
                                            style: tabTextStyle5555(Colors.white)
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                              )
                          ),

                          Row(
                            children: [
                              Flexible(flex: 1,child:
                              GestureDetector(
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: AspectRatio(
                                      aspectRatio: 3.5/1,
                                      child: Container(
                                        margin: const EdgeInsets.only(bottom: 16,right: 8, left: 16),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0)),
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                        child: Center(
                                          child: Text("충전하기", style: tabTextStyle6666(Colors.white),),
                                        ),
                                      ),
                                    )
                                ),
                                onTap: (){
                                  _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                                },
                              ),),
                              Flexible(flex: 1,child:
                              GestureDetector(
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: AspectRatio(
                                      aspectRatio: 3.5/1,
                                      child: Container(
                                        margin: const EdgeInsets.only(bottom: 16,right: 16, left: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0)),
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                        child: Center(
                                          child: Text("적립내역", style: tabTextStyle6666(Colors.white),),
                                        ),
                                      ),
                                    )
                                ),
                                onTap: (){
                                  _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                                },
                              ),)
                            ],
                          )
                        ],
                      ),
                    ),),),

                  GestureDetector(
                    child:
                    Padding(padding: const EdgeInsets.all(16),
                      child: AspectRatio(aspectRatio: 4/1,
                        child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0)),
                              color: Color(0xfffa8a1b),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(padding: EdgeInsets.only(left: 16,top: 8,bottom: 8, right: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("이번주 적립 가능한 포인트", style: tabTextStyle2222(Colors.white.withOpacity(0.9)),),
                                            const SizedBox(height: 2,),
                                            Text("조회하기", style: tabTextStyle7777(Colors.white),)
                                          ],
                                        ),
                                        Icon(Icons.keyboard_arrow_right, color:Colors.white,),
                                      ],
                                    )
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    ),
                    onTap: () {
                      _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                    },
                  ),

                  Padding(padding: const EdgeInsets.only(left: 16, right: 16),child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("내가 즐겨찾는 알짜몬", style: tabTextStyle8888(blacktext),),
                      IconButton(
                        icon: const Icon(Icons.settings, color:blacktext,),
                        iconSize: 24,
                        onPressed: () => {
                        _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.")
                        }
                      ),
                    ],
                  ),),

                  Padding(padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
                    child: AspectRatio(aspectRatio: 16/9,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0)),
                          color: Color(0xfff7f7f7),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("즐겨찾는 알짜몬이 없습니다.", style: tabTextStyle9999(Colors.black),),
                            Text("내가 자주가는 알짜몬을 등록해보세요.", style: tabTextStyle6666(Colors.grey)),
                            const SizedBox(height: 16,),

                            GestureDetector(
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0)),
                                  color: primary,
                                ),
                                child: Center(
                                  child: Text(
                                    "알짜몬 등록하기", style: tabTextStyle6666(
                                      Colors.white
                                  ),
                                  ),
                                ),
                              ),
                              onTap: (){
                                _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                              },
                            )
                          ],
                        ),
                      ),),),


                  GestureDetector(
                    child: Container(
                        margin: EdgeInsets.only(right: 16,left: 16),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0)),
                            color: Color(0xff74cdc9)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("알아두면 좋은", style: TextStyle(
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      letterSpacing: 4,
                                      color: Colors.white
                                  ),),
                                  Text("분리수거 방법들", style: TextStyle(
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      letterSpacing: 4,
                                      color: Colors.white
                                  ),),
                                  Text("알짜몬이 알려드려요", style: TextStyle(
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      letterSpacing: 4,
                                      color: Colors.white
                                  ),),
                                ],
                              ),
                              const Image(image: AssetImage("lib/assets/icons/lightbulb.png"))
                            ],
                          ),
                        )
                    ),
                    onTap: (){
                      _showDialog(context, "현재 서비스 준비중 입니다","많은 관심과 기대 부탁드립니다.");
                    },
                  ),

                  // Padding(padding: const EdgeInsets.only(left: 16),child: Text("알짜 뉴스", style: tabTextStyle8888(blacktext),),),
                  //
                  //
                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     autoPlay: true,
                  //     aspectRatio: 2.0,
                  //     enlargeCenterPage: true,
                  //   ),
                  //   items: imageSliders,
                  // ),

                  SizedBox(height: 16,)

                ],
              ),
            ) : const splashItem(colors: primary,)
        )
    );

  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(const Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 0.0),
                    child: Text(
                      'No. ${imgList.indexOf(item)} image',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ))
      .toList();


}

void _showDialog(context, title, subtitle) {

  showDioalogCustom(context, title, subtitle);

}
