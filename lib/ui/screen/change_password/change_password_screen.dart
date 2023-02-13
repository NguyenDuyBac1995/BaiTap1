import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:flutter/material.dart';

import '../../widget/components/common.dart';
import '../../widget/utils/colors.dart';
import '../../widget/utils/text_styles.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context, suffixIcon: false, color: false),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Change Password', style: TextStyles.textSize24.copyWith(fontSize: 32),),
            SizedBox(height: 50),
            Text(
              "Current Password",
              style: TextStyles.textItem,
            ),
            SizedBox(height: 10),
            Common().textFromField(
              textStyle: TextStyles.textSize20,
              controller: _textController1,
              obscureText: _obscureText,
              icons: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility)),
              validation: true,
              validationError: _textController1.text.length < 6 ? 'Password too short' : null ,
            ),
            SizedBox(height: 40),
            Text(
              "New Password",
              style: TextStyles.textItem
            ),
            SizedBox(height: 10),
            Common().textFromField(
              textStyle: TextStyles.textSize20,
              controller: _textController2,
              obscureText: _obscureText1,
              icons: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText1 = !_obscureText1;
                    });
                  },
                  icon: Icon(
                      _obscureText1 ? Icons.visibility_off : Icons.visibility)),
              validation: true,
              validationError: _textController2.text.length < 6 ? 'Password too short' : null ,
            ),
            SizedBox(height: 40),
            Text(
              "Confirm new password",
              style: TextStyles.textItem
            ),
            SizedBox(height: 10),
            Common().textFromField(
              textStyle: TextStyles.textSize20,
              controller: _textController3,
              obscureText: _obscureText2,
              icons: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText2 = !_obscureText2;
                    });
                  },
                  icon: Icon(
                      _obscureText2 ? Icons.visibility_off : Icons.visibility)),
              validation: true,
              validationError: _textController3.text.length < 6 ? 'Password too short' : null ,
            ),

          ],
        ),
      ),
    );
  }
}
