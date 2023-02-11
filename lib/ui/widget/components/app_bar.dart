import 'package:bai_tap_figma1/ui/widget/utils/colors.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../router/fluro_navigator.dart';
import '../../router/router_generator.dart';

PreferredSize appBarCommonV1(BuildContext context,
    {String? strTitle, TextEditingController? controller, bool? suffixIcon}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colos.LOGINTEXT1,
                  ),
                ),
                Text(strTitle??'', textAlign: TextAlign.center,style: TextStyles.textAppBar ,),
                suffixIcon == true ? Container(width: 40 ): IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_outlined))
              ],
            )
          ],
        ),
      ));
}

PreferredSize appBarCommonV2(BuildContext context,
    {String? strTitle, TextEditingController? controller}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Column(
      children: [
        SizedBox(height: 45),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(strTitle??'', style: TextStyles.textSize24,),
              IconButton(
                  onPressed: () {
                    NavigatorUtils.push(context, RouterGenerator.routeMenu);
                  },
                  icon: Transform.scale(
                      scale: 1.15,
                      child: SvgPicture.asset('assets/svg/Union.svg')))
            ],
          ),
        )
      ],
    ),
  );
}