
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
          children: [
            const WebView(
              initialUrl: 'https://everless.co.kr',
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
            ),

            Positioned.fill(child:
            GestureDetector(
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 44,left: 16),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24,
                    ),
                  )
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            )
          ],
        )
    );
  }
}