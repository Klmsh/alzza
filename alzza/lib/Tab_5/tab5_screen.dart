
import 'package:alzza/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../style/styles.dart';
import '../widgets/App_MenuItem.dart';
import '../widgets/App_TextBox.dart';
import 'component/tab5_advise_screen.dart';
import 'component/tab5_inquiry_item.dart';

class Tab5_Screen extends StatefulWidget {
  const Tab5_Screen({Key? key}) : super(key: key);

  @override
  _Tab5_ScreenState createState() => _Tab5_ScreenState();
}

class _Tab5_ScreenState extends State<Tab5_Screen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();



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
          onPressed: () => null,
        ),

        title: Text("프로필",style: TextStyle(
          color: Colors.black,
          fontFamily: "Noto",
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 2),
            child: IconButton(
              icon: const Icon(Icons.settings, color:Colors.black,),
              iconSize: 24,
              onPressed: () => null,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(right: 16),
                    child: const AspectRatio(
                      aspectRatio: 1/1,
                      child: Image(image: AssetImage("lib/assets/logos/alzza_profile.png",),fit: BoxFit.contain,),
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      App_TextBox(MainActivity.list_data[0], labelSize: 16, labelColor: Colors.black,),
                      const SizedBox(height: 8,),
                      App_TextBox(MainActivity.list_data[2], labelSize: 13, labelColor: Colors.grey,),
                    ],
                  ),
                ],
              )
            ),

            Container(
              width: double.infinity,
              height: 4,
              color: Colors.grey.shade100,
            ),

            MenuItems(title: '공지사항', icon: const Icon(Icons.campaign_outlined, color: Colors.black,), onPressed: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tab5_Advise_Screen()),
              );
            }),

            Container(
              height: 2,
              color: Colors.grey.shade100,
              margin: const EdgeInsets.only(left: 8, right: 12),
            ),
            MenuItems(title: '문의하기', icon: const Icon(Icons.contact_support_outlined, color: Colors.black,), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tab5_inquiry_item()),
              );
            }),
            Container(
              height: 2,
              color: Colors.grey.shade100,
              margin: const EdgeInsets.only(left: 8, right: 12),
            ),

            MenuItems(title: '앱 공유하기', icon: const Icon(Icons.share_outlined, color: Colors.black,), onPressed: (){
              share();
            }),
            Container(
              height: 2,
              color: Colors.grey.shade100,
              margin: const EdgeInsets.only(left: 8, right: 12),
            ),



          ],
        ),
      ),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title'
    );
  }
}
