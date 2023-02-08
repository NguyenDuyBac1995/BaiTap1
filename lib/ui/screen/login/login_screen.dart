import 'package:bai_tap_figma1/ui/router/fluro_navigator.dart';
import 'package:bai_tap_figma1/ui/router/router_generator.dart';
import 'package:bai_tap_figma1/ui/widget/utils/assets_utils.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widget/utils/colors.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        height: MediaQuery.of(context).size.height * 1.1,
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
                  SizedBox(height: 4),
                  Text(
                    'Best cloud storage platform for all',
                    style: TextStyles.textSize14,
                  ),
                  Text('business and individual to',
                      style: TextStyles.textSize14),
                  Text('manage there data', style: TextStyles.textSize14),
                  SizedBox(height: 25),
                  Text('Join For Free', style: TextStyles.textSize14),
                  SizedBox(height: 30),
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
                              Image.asset('assets/image/Vector 1.png')
                            ],
                          ),
                        ),
                        onTap: (){
                         var data = DataBundle(id: "123567");
                          Navigator.pushNamed(context, RouterGenerator.routeLoginAcount,arguments: data );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text('Use Social Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xff1B1D28),fontSize: 12)),
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
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Create an account',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff1B1D28),fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
