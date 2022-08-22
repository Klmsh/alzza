import 'package:flutter/material.dart';

class MenuItems extends StatefulWidget {

  final Function onPressed;
  final Widget icon;
  final String title;

  const MenuItems(
      {
        Key? key,
        required this.onPressed,
        required this.icon,
        required this.title,
      }) : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { widget.onPressed(); },
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          0,
          20,
          0,
          20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: widget.icon,
            ),

            const SizedBox(
              width: 10,
            ),

            Expanded(
                flex: 8,
                child: Container(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'esamanru_Light',
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      )
                  ),
                )
            ),

            const SizedBox(
              width: 10,
            ),

            Expanded(
              flex: 1,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
