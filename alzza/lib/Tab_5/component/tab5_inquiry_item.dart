
import 'package:flutter/material.dart';
import "dart:ui" as ui;
import '../../widgets/App_TextBox.dart';


class Tab5_inquiry_item extends StatefulWidget {

  const Tab5_inquiry_item(
      {
        Key? key,
      }) : super(key: key);

  @override
  State<Tab5_inquiry_item> createState() => _Tab5_inquiry_itemState();
}

class _Tab5_inquiry_itemState extends State<Tab5_inquiry_item> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: const App_TextBox("문의하기",labelSize: 16, labelColor: Colors.black,),

        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black,),
          iconSize: 24,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Container(
              margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child:TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: '성함',
                  labelText: '성함',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child:const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: '연락처',
                  labelText: '연락처',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child:const TextField(
                decoration: InputDecoration(
                  hintText: '문의내용',
                  labelText: '문의내용',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



