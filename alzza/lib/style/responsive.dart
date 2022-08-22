import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {

  final Widget moblie;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({Key? key, required this.moblie,
  this.tablet, required this.desktop}) : super(key: key);

  static bool isMoblie(BuildContext context) =>
      MediaQuery.of(context).size.width < 501;

  static bool isTable(BuildContext context) =>
      MediaQuery.of(context).size.width < 980 &&
          MediaQuery.of(context).size.width > 500;

  static bool isDestop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 980;

  @override
  Widget build(BuildContext context) {

    final Size _size = MediaQuery.of(context).size;

    if(_size.width >= 980){
      return desktop;
    }
    else if(_size.width > 500 && tablet != null){
      return tablet!;
    }
    else {
      return moblie;
    }

  }
}
