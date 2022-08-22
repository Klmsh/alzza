import 'dart:convert';

import 'package:alzza/style/alzza_https.dart';
import 'package:alzza/tab_5/component/tab5_advise_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "dart:ui" as ui;

import '../../widgets/App_TextBox.dart';


class Tab5_Advise_Screen extends StatefulWidget {
  const Tab5_Advise_Screen({Key? key}) : super(key: key);

  @override
  _Tab5_Advise_ScreenState createState() => _Tab5_Advise_ScreenState();
}

class getsetter{
  String advise_id;
  String advise_title;
  String advise_date;
  String advise_information;
  getsetter(this.advise_id,this.advise_title,this.advise_date,this.advise_information);
}

class _Tab5_Advise_ScreenState extends State<Tab5_Advise_Screen> with TickerProviderStateMixin {

  late ScrollController _ScrollController;
  late AppHttps appHttps;
  List<getsetter> advise_list = [];
  bool dataIsReady = false;

  @override
  void initState() {
    appHttps = AppHttps();
    super.initState();
    _ScrollController = ScrollController();
    setData();
  }

  Future<void> setData() async {
    String result = await appHttps.getAdviseData();
    var resultData = jsonDecode(result);
    List _list = resultData;
    for (int i = 0; i < _list.length; i++){
      var results = _list[i];
      advise_list.add(getsetter(results["advise_id"].toString(), results["advise_title"], results["advise_date"], results["advise_information"], ));
    }
    setState((){
      dataIsReady = true;
    });
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

        body: dataIsReady ? ListView.builder(
            itemCount: advise_list.length,
            itemBuilder: (context, index) {
              var item = advise_list[index];
              return Tab5_advise_Item(id: item.advise_id, labelTitle: item.advise_title, labelTime: item.advise_date, labelinformation: item.advise_information,);
            }) : SizedBox.shrink()

    );

  }
}