import 'dart:io';

import 'package:alzza/splashActivity.dart';
import 'package:alzza/style/alzza_https.dart';
import 'package:alzza/style/styles.dart';
import 'package:alzza/tab_5/tab5_screen.dart';
import 'package:flutter/material.dart';

import 'Tab_1/tab1_screen.dart';
import 'Tab_2/tab2_screen.dart';
import 'Tab_3/tab3_screen.dart';
import 'Tab_4/tab4_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.renderView.automaticSystemUiAdjustment=false;

  try
  {
    runApp((const MainActivity()));
  }
  catch(e)
  {
    print("MainActivity : " + e.toString());
    exit(0);
  }

}

class MainActivity extends StatefulWidget {
  static List list_data = [];


  const MainActivity({Key? key}) : super(key: key);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '알짜',
        theme: lightTheme,
        home: const BottomNavigation()
    );
  }
}
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {

  bool isSplash = false;
  final Tab1_Screen _tab1 = const Tab1_Screen();
  final Tab2_Screen _tab2 = const Tab2_Screen();
  final Tab3_Screen _tab3 = const Tab3_Screen();
  final Tab4_Screen _tab4 = const Tab4_Screen();
  final Tab5_Screen _tab5 = const Tab5_Screen();

  int _selectedIndex = 0;
  static GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');
  late AppHttps appHttps;

  _pageChooser(int page) {
    switch (page) {

      case 0 :
        return _tab1;
        break;

      case 1 :
        return _tab2;
        break;

      case 2 :
        return _tab3;
        break;

      case 3 :
        return _tab4;
        break;

      case 4 :
        return _tab5;
        break;

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appHttps = AppHttps();
    setAppVersion();
  }

  Future<void> setAppVersion() async{
    await appHttps.getUserData();
    await Future.delayed(const Duration(seconds: 2));
    setState((){
      isSplash = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isSplash ? SplashActivity() : _pageChooser(_selectedIndex),
      bottomNavigationBar: !isSplash ? SizedBox.shrink() : SizedBox(
        width: double.infinity,
        child: BottomNavigationBar(
          key: globalKey,
          iconSize: 20,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items:  const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 16/4),
                child: Icon(Icons.home, color:Colors.black,),
              ),
              label: "홈",
            ),

            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 16/4),
                child:  Icon(Icons.control_point_duplicate_outlined, color:Colors.black,),
              ),
              label: "포인트",
            ),

            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 16/4),
                child:  Icon(Icons.location_on_outlined, color:Colors.black,),
              ),
              label: "위치",
            ),

            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 16/4),
                child:  Icon(Icons.storefront, color:Colors.black,),
              ),
              label: "스토어",
            ),

            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 16/4),
                child:  Icon(Icons.person, color:Colors.black,),
              ),
              label: "프로필",
            ),

          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          selectedLabelStyle: headerHoverTextStyle( Colors.black),
          unselectedLabelStyle: headerHoverTextStyle( Colors.black),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (int index)
          {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}