import 'package:alzza/style/splashItem.dart';
import 'package:alzza/style/styles.dart';
import 'package:flutter/material.dart';

class SplashActivity extends StatefulWidget {
  const SplashActivity({Key? key}) : super(key: key);

  @override
  State<SplashActivity> createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [

          Positioned.fill(child:
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'lib/assets/logos/alzza_simbol.png',
              fit: BoxFit.fitWidth,
              width: 200,
            ),
          )),

          Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/logos/alzza_text.png',
                        fit: BoxFit.fitWidth,
                        width: 300,
                      ),
                      const SizedBox(height: 160,),
                      const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                    ],
                  ),
                ),
              )
          ),

          Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 32, right: 16),
                  child: Image.asset(
                    'lib/assets/logos/everless_logo.png',
                    fit: BoxFit.fitWidth,
                    width: 100,
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
