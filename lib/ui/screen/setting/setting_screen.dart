import 'package:bai_tap_figma1/ui/router/fluro_navigator.dart';
import 'package:bai_tap_figma1/ui/router/router_generator.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../widget/components/app_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _switchItem1 = false ;
  bool _switchItem2 = false ;
  final List _settingItem = [
    {'name': 'Add Account', 'route': RouterGenerator.routeCreateAccount},
    {'name': 'Change Password','route': RouterGenerator.routeChangePassword},
    {'name': 'Change Language','route': RouterGenerator.routeChangeLanguage },
    {'name': 'Upgrade Plan','route':''},
    {'name': 'Multiple Account','route':''},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context,color: false, suffixIcon: false),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Settings', style: TextStyles.textSize24.copyWith(fontSize: 32),),
            SizedBox(height: 25),
            Container(
              height: 410,
              child: ListView.builder(
                itemCount: _settingItem.length,
                  itemBuilder:(BuildContext context, index){
                    return GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 23),
                        child: Text(_settingItem[index]['name'], style: TextStyles.textItem,),
                      ),
                      onTap: (){
                        NavigatorUtils.push(context, '${_settingItem[index]['route']}');
                      },
                    );
                  }
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Enable Sync', style: TextStyles.textSize24.copyWith(fontSize: 20),),
                FlutterSwitch(
                  width: 46,
                    height: 26,
                    toggleSize: 17,
                    inactiveColor: Color(0xff00BCD4),
                    value: _switchItem1,
                    onToggle:
                    (val){
                      setState(() {
                        _switchItem1 =val;
                      });
                })
              ],
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Enable 2 Step Verification', style: TextStyles.textSize24.copyWith(fontSize: 20),),
                FlutterSwitch(
                    width: 46,
                    height: 26,
                    toggleSize: 17,
                    inactiveColor: Color(0xff00BCD4),
                    value: _switchItem2,
                    onToggle:
                        (val){
                      setState(() {
                        _switchItem2 = val;
                      });
                    }
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
