import 'package:bai_tap_figma1/ui/router/fluro_navigator.dart';
import 'package:bai_tap_figma1/ui/router/router_generator.dart';
import 'package:bai_tap_figma1/ui/widget/utils/assets_utils.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widget/components/common.dart';
import '../../widget/utils/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textUserName = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();
  var _userName;
  String? _password;
  var value;

  _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getString('$_userName');
    if (value != null) {
      _password = value;
      validateAndSave();
    } else {
      validateAndSave();
    }
  }

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _fromKey.currentState;
    if (form!.validate()) {
      NavigatorUtils.push(context, RouterGenerator.routeHome);
    } else {
      print('Form is valid');
    }
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 1.1,
        child: Stack(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1.1,
              child: Transform.scale(
                  scale: 1.08, child: Image.asset(ImageUtils.NEN)),
            ),
            Container(
              padding: EdgeInsets.only(left: 25, top: 80, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(ImageUtils.LOGO),
                  Text("Welcome to", style: TextStyles.textSize20),
                  Text(
                    "Dirbbox",
                    style: TextStyles.textSize20
                        .copyWith(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  _showLogin ? _outText() : _textFiled(),
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Text('Use Social Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff1B1D28), fontSize: 12)),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/Instagram Logo.svg'),
                      SizedBox(width: 50),
                      SvgPicture.asset('assets/svg/Twitter Logo.svg'),
                      SizedBox(width: 50),
                      SvgPicture.asset('assets/svg/Facebook Logo.svg'),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: TextButton(
                      child: Text(
                        'Create an account',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      onPressed: () {
                        NavigatorUtils.push(
                            context, RouterGenerator.routeCreateAccount);
                      },
                    )
                )),
          ],
        ),
      ),
    );
  }

  Widget _outText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text(
          'Best cloud storage platform for all',
          style: TextStyles.textSize14,
        ),
        Text('business and individual to',
            style: TextStyles.textSize14),
        Text('manage there data', style: TextStyles.textSize14),
        SizedBox(height: 40),
        Text('Join For Free', style: TextStyles.textSize14),
        SizedBox(height: 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colos.CA.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/Group.png'),
                    SizedBox(width: 5),
                    Text('Smart Id',
                        style: TextStyles.textSize14.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colos.CA))
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colos.CA,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign in',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward, color: Colors.white,)
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  _showLogin = false;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _textFiled() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Username or email address",
                style: TextStyles.textAppBar,
              ),
              SizedBox(height: 10),
              Common().textFromField(
                  hintValue: 'Username or email',
                  controller: _textUserName,
                  icons: Icon(Icons.person),
                  validation: true,
                  validationError: value == null ? 'Incorrect username' : null,
                  callBackSearch: () {
                    setState(() {
                      _userName = _textUserName.text;
                    });
                  }
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     focusedBorder: OutlineInputBorder(
              //       borderSide:
              //       BorderSide(width: 0.5, color: Colors.blue),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     border: OutlineInputBorder(
              //         borderSide: BorderSide(
              //             width: 0.5, color: Colors.black38),
              //         borderRadius: BorderRadius.circular(10)),
              //     hintText: 'Username or email',
              //     prefixIcon: Icon(Icons.person),
              //   ),
              //   validator: (val) =>
              //   value == null ? 'Incorrect username' : null,
              //   onChanged: (val) {
              //     setState(() {
              //       _userName = val;
              //     });
              //   },
              // ),
              SizedBox(height: 10),
              Text(
                "Password",
                style: TextStyles.textAppBar,
              ),
              SizedBox(height: 10,),
              Common().textFromField(
                  hintValue: 'Password',
                  icons: Icon(Icons.lock),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                      icon: Icon( _obscureText ? Icons.visibility_off
                              : Icons.visibility)),
                validation: true,
                validationError: _textPassword != _password ? 'Incorrect password' : null,
                obscureText: _obscureText,
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     focusedBorder: OutlineInputBorder(
              //       borderSide:
              //       BorderSide(width: 0.5, color: Colors.blue),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     border: OutlineInputBorder(
              //         borderSide: BorderSide(
              //             width: 0.5, color: Colors.black38),
              //         borderRadius: BorderRadius.circular(10)),
              //     hintText: 'Password',
              //     prefixIcon: Icon(Icons.lock),
              //     suffixIcon: IconButton(
              //         onPressed: _toggle,
              //         icon: Icon(_obscureText
              //             ? Icons.visibility_off
              //             : Icons.visibility)),
              //   ),
              //   validator: (val) =>
              //   val != _password ? 'Incorrect password' : null,
              //   obscureText: _obscureText,
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colos.CA.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: Colos.CA,
                    ),
                    SizedBox(width: 5),
                    Text('Back',
                        style: TextStyles.textSize14.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colos.CA))
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  _showLogin = true;
                });
              },
            ),
            GestureDetector(
              child: Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colos.CA,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign in',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              onTap: () {
                _getData();
              },
            ),
          ],
        ),
      ],
    );
  }
}
