import 'package:flutter/material.dart';

class App_TextBox extends StatefulWidget {

  final double? labelSize;
  final String labelText;
  final Color? labelColor;
  final int? maxLines;

  const App_TextBox(
      this.labelText,
      {
        Key? key,
        this.labelSize,
        this.maxLines,
        this.labelColor,
      }) : super(key: key);

  @override
  State<App_TextBox> createState() => _App_TextBoxState();
}

class _App_TextBoxState extends State<App_TextBox> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.labelText,
      style: TextStyle(
        fontSize: widget.labelSize,
        color: widget.labelColor ?? Colors.black,
        fontFamily: "esamanru_Light",
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: widget.maxLines,
    );
  }
}
