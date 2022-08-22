
import 'package:flutter/material.dart';
import "dart:ui" as ui;

import '../../widgets/App_TextBox.dart';


class Tab5_advise_SingleItem extends StatefulWidget {

  final String id;
  final String labelTitle;
  final String labelTime;
  final String label_information;

  const Tab5_advise_SingleItem(
      {
        Key? key,
        required this.id,
        required this.labelTitle, required this.labelTime,
        required this.label_information
      }) : super(key: key);

  @override
  State<Tab5_advise_SingleItem> createState() => _Tab5_advise_SingleItemState();
}

class _Tab5_advise_SingleItemState extends State<Tab5_advise_SingleItem> {

  String label = "";

  @override
  void initState() {

    super.initState();

    label = widget.label_information;
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
        title: const App_TextBox("공지사항",labelSize: 16, labelColor: Colors.black,),

        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black,),
          iconSize: 24,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(child:
              Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          App_TextBox(
                            widget.labelTitle, labelSize: 17, labelColor: Colors.black,
                            maxLines: 2,
                          ),

                          const SizedBox(height: 16,),

                          App_TextBox(
                            widget.labelTime, labelSize: 12, labelColor: Colors.grey,
                          ),

                          Container(
                            height: 1,
                            color: Colors.grey.shade300,
                            margin: const EdgeInsets.only(top: 20, bottom: 4),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      child: Text(label,style: TextStyle(fontSize: 16, color: Colors.black),),
                      padding: const EdgeInsets.all(16),
                    ),

                    const SizedBox(height: 16,)

                  ]
              )
                ,),
            ),
          ),
        ],
      ),
    );
  }
}



