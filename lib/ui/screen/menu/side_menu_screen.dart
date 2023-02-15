import 'package:bai_tap_figma1/ui/router/fluro_navigator.dart';
import 'package:bai_tap_figma1/ui/router/router_generator.dart';
import 'package:bai_tap_figma1/ui/widget/components/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import '../../widget/utils/text_styles.dart';
import 'dart:io';


class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Stack(
        children: [
          Container(
            height: 145,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 60, left: 36, right: 40, bottom: 35),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(45))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                            scale: 1.3,
                            child: SvgPicture.asset(
                                'assets/svg/Profile Image.svg')),
                        SizedBox(width: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NeeLesh',
                              style: TextStyle(
                                color: Color(0xff1B1D28),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Seattle, Washington',
                              style: TextStyle(
                                  color: Color(0xff7B7F9E),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Transform.scale(
                            scale: 1.4,
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                            ))),
                  )
                ]),
          ),
          Container(
              padding: EdgeInsets.only(top: 220),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Common().ItemList(
                      strName: 'Home',
                      value: _selectedIndex == 1,
                      callback: () {
                        Navigator.pop(context);
                      }),
                  Common().ItemList(
                      strName: 'Profile',
                      value: _selectedIndex == 2,
                      callback: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                        NavigatorUtils.push(
                            context, RouterGenerator.routeProfile);
                      }),
                  Common().ItemList(
                      strName: 'Storage',
                      value: _selectedIndex == 3,
                      callback: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                        NavigatorUtils.push(
                            context, RouterGenerator.routeStorageDetail);
                      }),
                  Common().ItemList(strName: 'Shared', value: _selectedIndex == 4,
                      callback: (){
                        setState(() {
                          _selectedIndex = 4;
                        });
                        if (Platform.isIOS) {
                          Share.share(
                              'https://apps.apple.com/us/app/ch%E1%BA%B7n-l%E1%BB%ABa-%C4%91%E1%BA%A3o/id6444795935');
                        } else {
                          Share.share(
                              'https://play.google.com/store/apps/details?id=com.mrblank.master_check');
                        }
                      }),
                  Common().ItemList(
                      strName: 'Stats',
                      value: _selectedIndex == 5,
                      callback: () {
                        setState(() {
                          _selectedIndex = 5;
                        });
                        Common().selectedURL('https://www.google.com/');
                      }),
                  Common().ItemList(
                      strName: 'Settings',
                      value: _selectedIndex == 6,
                      callback: () {
                        setState(() {
                          _selectedIndex = 6;
                        });
                        NavigatorUtils.push(
                            context, RouterGenerator.routeSetting);
                      }),
                  Common().ItemList(
                      strName: 'Help',
                      value: _selectedIndex == 7,
                      callback: () {
                        setState(() {
                          _selectedIndex = 7;
                        });
                        Common().selectedURL('https://www.google.com/');
                      }),
                ],
              )),
          Positioned(
            bottom: 120,
            child: GestureDetector(
              child: Row(
                children: [
                  SizedBox(width: 30),
                  SvgPicture.asset('assets/svg/logout.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Logout',
                    style: TextStyles.textSize24.copyWith(fontSize: 22),
                  )
                ],
              ),
              onTap: () {
                NavigatorUtils.push(context, RouterGenerator.routeLogin);
              },
            ),
          ),
          Positioned(
              bottom: 50,
              left: 30,
              child: Text(
                'Version 2.0.1',
                style: TextStyles.textSize13,
              ))
        ],
      ),
    );
  }
}
