import 'package:bai_tap_figma1/ui/router/fluro_navigator.dart';
import 'package:bai_tap_figma1/ui/router/router_generator.dart';
import 'package:bai_tap_figma1/ui/widget/components/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widget/utils/text_styles.dart';

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  List _menuItem = [
    {'name': 'Home', 'route': RouterGenerator.routeHome},
    {'name': 'Profile', 'route': RouterGenerator.routeProfile},
    {'name': 'Storage', 'route': RouterGenerator.routeStorageDetail},
    {'name': 'Shared', 'route': ''},
    {'name': 'Stats', 'route': ''},
    {'name': 'Settings', 'route': RouterGenerator.routeSetting},
    {'name': 'Help', 'route': ''}
  ];

  var checkedIndex;

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
            padding: EdgeInsets.only(top: 190),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: _menuItem.length,
              itemBuilder: (BuildContext context, index) {
                return Common().ItemList(
                    strName: _menuItem[index]['name'],
                    value: checkedIndex == _menuItem[index]['name'],
                    callback: () {
                      setState(() {
                        checkedIndex = _menuItem[index]['name'];
                      });
                      NavigatorUtils.push(
                          context, _menuItem[index]['route']);
                    });
              }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 6 , color: Colors.transparent,); },
            ),
          ),
          Positioned(
            bottom: 120,
            child: GestureDetector(
              child: Row(
                children: [
                  SizedBox(width: 30),
                  SvgPicture.asset('assets/svg/logout.svg'),
                  SizedBox(width: 10),
                  Text('Logout', style: TextStyles.textSize24.copyWith(fontSize: 22),)
                ],
              ),
              onTap: (){
                NavigatorUtils.push(context, RouterGenerator.routeLogin);
              },
            ),
          ),
          Positioned(
            bottom: 50,
              left: 30,
              child: Text('Version 2.0.1', style: TextStyles.textSize13,))
        ],
      ),
    );
  }
}
