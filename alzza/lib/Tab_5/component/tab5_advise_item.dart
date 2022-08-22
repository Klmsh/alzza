import 'package:alzza/tab_5/component/tab5_advise_singleitem.dart';
import 'package:flutter/material.dart';
import "dart:ui" as ui;

import '../../widgets/App_TextBox.dart';


class Tab5_advise_Item extends StatefulWidget {

  final String id;
  final String labelTitle;
  final String labelTime;
  final String labelinformation;

  const Tab5_advise_Item(
      {
        Key? key,
        required this.id,
        required this.labelTitle,
        required this.labelTime,
        required this.labelinformation,
      }) : super(key: key);

  @override
  State<Tab5_advise_Item> createState() => _Tab5_advise_ItemState();
}

class _Tab5_advise_ItemState extends State<Tab5_advise_Item> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                App_TextBox(
                  widget.labelTitle, labelSize: 16, labelColor: Colors.black,
                  maxLines: 2,
                ),

                const SizedBox(height: 16,),

                App_TextBox(
                  widget.labelTime, labelSize: 11, labelColor: Colors.grey,
                  maxLines: 2,
                ),

                Container(
                  height: 1,
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.only(top: 20),
                ),
              ],
            ),
          )
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Tab5_advise_SingleItem(id: widget.id, labelTitle: widget.labelTitle, labelTime: widget.labelTime, label_information: widget.labelinformation)),
        );
      },
    );
  }
}
