
import 'package:alzza/style/styles.dart';
import 'package:flutter/material.dart';

class splashItem extends StatelessWidget {

  final Color colors;
  const splashItem({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child:
          Container(
              margin: EdgeInsets.only(bottom: 50.0),
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(colors)))
      ),
    );
  }
}