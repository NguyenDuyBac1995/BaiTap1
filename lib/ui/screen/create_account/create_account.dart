import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:bai_tap_figma1/ui/widget/components/common.dart';
import 'package:bai_tap_figma1/ui/widget/utils/colors.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _textUserName = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();

  String? strName;
  String? strPassword;

  resetNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('$strName', '$strPassword');
    var value = prefs.getString('$strName');
    print('$value');
  }
  bool _obscureText = true;
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          appBarCommonV1(context, strTitle: 'Create Account', suffixIcon: true),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Form(
          key: _fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Create Acccount',
                style: TextStyle(
                    color: Color(0xff1B1D28),
                    fontFamily: 'gilroy',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Text(
                "Username or email address",
                style: TextStyles.textSize20.copyWith(color: Colos.DAtext),
              ),
              SizedBox(height: 20),
              Common().textFromField(
                textStyle: TextStyles.textSize20,
                controller: _textUserName,
                icons: Icon(Icons.person),
              ),
              SizedBox(height: 40),
              Text(
                "Password",
                style: TextStyles.textSize20.copyWith(color: Colos.DAtext),
              ),
              SizedBox(height: 20),
              Common().textFromField(
                textStyle: TextStyles.textSize20,
                controller: _textPassword,
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
                validationError: _textPassword.text.length < 6 ? 'Password too short' : null ,
              ),
              SizedBox(height: 50),
              Common().ButtonStyle(
                color: Colos.CA,
                textValue: 'Create Account',
                width: MediaQuery.of(context).size.width,
                icon: false,
                callback: (){
                  setState(() {
                    strName = _textUserName.text;
                    strPassword = _textPassword.text;
                    resetNewLaunch();
                  }
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
