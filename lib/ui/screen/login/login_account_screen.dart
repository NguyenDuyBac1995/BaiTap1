import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../router/fluro_navigator.dart';
import '../../router/router_generator.dart';
import '../../widget/utils/assets_utils.dart';
import '../../widget/utils/colors.dart';
import '../../widget/utils/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAcount extends StatefulWidget {
  const LoginAcount({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<LoginAcount> createState() => _LoginAcountState();
}

class _LoginAcountState extends State<LoginAcount> {
  resetNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('NguyenDuyBac', '123456');
  }
  String? text;
  var value;
  _getData()async{
    print('$_password');
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   value = prefs.getString('$_password');
   print('$value');
   if (
   value != null
   ){
     text = value;
   }
  }

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  void validateAndSave (){
    final FormState? form = _fromKey.currentState;
    if (form!.validate()) {
      NavigatorUtils.push(context, RouterGenerator.routeHome);
    } else {
      print('Form is valid');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(' DATA : ${widget.id}');
  }

  bool _obscureText = true;
  var _password;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.1,
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
                    SizedBox(height: 10),
                    Form(
                      key: _fromKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Username or email address",style: TextStyles.textSize14,),
                          TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 0.5, color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(width: 0.5, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Username or email',
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (val) =>
                            value == null ? 'Incorrect username' : null,
                            onChanged: (val) => _password = val,
                          ),
                          SizedBox(height: 5),
                          Text("Password",style: TextStyles.textSize14,),
                          TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(width: 0.5, color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(width: 0.5, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: _toggle,
                                  icon: Icon(_obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                            ),
                            validator: (val) =>
                            val != text ? 'Password too short' : null,
                            obscureText: _obscureText,

                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,
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
                              color: Color(0xffe3e7ef),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colos.CA,
                                ),
                                SizedBox(width: 5),
                                Text('Back page',
                                    style: TextStyles.textSize14.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colos.CA))
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
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
                              validateAndSave();
                            },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text('Use Social Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff1B1D28), fontSize: 12)),
                    ),
                    SizedBox(height: 20),
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
                left: 0,
                right: 0,
                bottom: 20,
                  child:  Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Create an account',
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(color: Color(0xff1B1D28), fontSize: 16),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
