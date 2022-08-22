import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class AppHttps {

  // Future getUserData() async
  // {
  //   var url = Uri.parse("https://everless.co.kr/tab_1/alzza_user.php");
  //   await http.get(url).then((response) {
  //     if (response.statusCode == 200) {
  //       String jsonString = utf8.decode(response.bodyBytes);
  //       var resultData = jsonDecode(jsonString);
  //       var result = resultData[0];
  //       MainActivity.list_data = [result["profile_nickname"].toString(), result["profile_points"].toString(), result["profile_email"].toString()];
  //       print(result);
  //     }
  //     else {
  //       print("getAlbaData Problem");
  //     }
  //   });
  //
  //   try{
  //
  //   }catch(e){
  //     print(e);
  //   }
  //
  // }
  //
  // Future<String> getAdviseData() async {
  //   String result = "false";
  //   try{
  //     var url = Uri.parse("https://everless.co.kr/tab_4/alzza_advise.php");
  //     await http.get(url).then((response) {
  //       if (response.statusCode == 200) {
  //         result = utf8.decode(response.bodyBytes);
  //       }
  //       else {
  //         print("getAlbaData Problem");
  //       }
  //     });
  //   }catch(e)
  //   {
  //
  //   }
  //   return result;
  // }


  Future getUserData() async
  {
    try{
      var url = Uri.parse("https://dalsis.com/tab_1/alzza_user.php");
      await http.get(url).then((response) {
        if (response.statusCode == 200) {
          String jsonString = utf8.decode(response.bodyBytes);
          var resultData = jsonDecode(jsonString);
          var result = resultData[0];
          MainActivity.list_data = [result["profile_nickname"].toString(), result["profile_points"].toString(), result["profile_email"].toString()];
          print(result);
        }
        else {
          print("getAlbaData Problem");
        }
      });
    }catch(e){
      print(e);
    }

  }

  Future<String> getAdviseData() async {
    String result = "false";
    try{
      var url = Uri.parse("https://dalsis.com/tab_4/alzza_advise.php");
      await http.get(url).then((response) {
        if (response.statusCode == 200) {
          result = utf8.decode(response.bodyBytes);
        }
        else {
          print("getAlbaData Problem");
        }
      });
    }catch(e)
    {

    }
    return result;
  }

}

