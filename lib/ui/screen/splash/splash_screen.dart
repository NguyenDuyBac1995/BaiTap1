import 'dart:async';

import 'package:bai_tap_figma1/ui/router/fluro_navigator.dart';
import 'package:bai_tap_figma1/ui/router/router_generator.dart';
import 'package:bai_tap_figma1/ui/widget/gradient_text/gradient_text.dart';
import 'package:bai_tap_figma1/ui/widget/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () { NavigatorUtils.push(context, RouterGenerator.routeLogin);});
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Color(0xFF101F2D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 180,
              child: Image.asset(ImageUtils.LOGO,
              fit: BoxFit.cover,
              alignment: Alignment.center,),
            ),
            SizedBox(height: 10),
            GradientText("Dirbbox",
                style: TextStyle(fontSize: 37),
                gradient: LinearGradient(
                    colors: [
                      Colors.indigo.shade500,
                      Colors.lightBlueAccent.shade200,
                      Colors.yellowAccent,
                    ]
                ))
          ],
        ),
      ),
    );
  }
}
