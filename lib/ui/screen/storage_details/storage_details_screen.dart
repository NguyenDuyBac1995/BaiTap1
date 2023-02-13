import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widget/components/common.dart';
import '../../widget/utils/colors.dart';
import '../../widget/utils/text_styles.dart';

class StorageScreen extends StatefulWidget {
  const StorageScreen({Key? key}) : super(key: key);

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context,
          strTitle: 'Storage Details', suffixIcon: true, color: false),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 190,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/image/Circular Pie@3x.png'),
                ),
                SizedBox(height: 30),
                Text(
                  'Available',
                  style: TextStyles.textSize22,
                ),
                SizedBox(height: 15),
                Text('43.36 GB', style: TextStyles.textSize24),
                SizedBox(height: 15),
                Text(
                  'Total 128 GB',
                  style: TextStyles.textSize22,
                ),
                SizedBox(height: 20),
                Common().StorageItem(
                    iconColor: Colos.LOGINTEXT1,
                    strNameFile: 'Design Files',
                    strGB: '38.66 GB',
                    assetsSvg: 'assets/svg/Group 36.svg'),
                Common().StorageItem(
                    iconColor: Colors.yellow,
                    strNameFile: 'Images',
                    strGB: '24.80 GB',
                    assetsSvg: 'assets/svg/Group 37.svg'),
                Common().StorageItem(
                    iconColor: Colors.green,
                    strNameFile: 'Design Files',
                    strGB: '12.60 GB',
                    assetsSvg: 'assets/svg/Group 38.svg'),
                Common().StorageItem(
                    iconColor: Colors.blueAccent,
                    strNameFile: 'Design Files',
                    strGB: '06.57 GB',
                    assetsSvg: 'assets/svg/Group 39.svg'),
                Common().StorageItem(
                    iconColor: Colors.deepOrangeAccent,
                    strNameFile: 'Design Files',
                    strGB: '02.01 GB',
                    assetsSvg: 'assets/svg/Group 40.svg'),
                SizedBox(height: 20),
                Text(
                  'Export Details',
                  style: TextStyles.textSize22.copyWith(fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
