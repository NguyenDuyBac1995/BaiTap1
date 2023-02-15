import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:flutter/material.dart';

class WidgetNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCommonV1(context, suffixIcon: false, color: true),
        body: Center(
          child: Text('Page Not Found'),
        ));
  }
}
