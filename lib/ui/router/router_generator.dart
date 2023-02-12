import 'package:bai_tap_figma1/ui/screen/change_password/change_password_screen.dart';
import 'package:bai_tap_figma1/ui/screen/create_account/create_account.dart';
import 'package:bai_tap_figma1/ui/screen/home/home_screen.dart';
import 'package:bai_tap_figma1/ui/screen/login/login_screen.dart';
import 'package:bai_tap_figma1/ui/screen/menu/side_menu_screen.dart';
import 'package:bai_tap_figma1/ui/screen/profile/profile_screen.dart';
import 'package:bai_tap_figma1/ui/screen/setting/setting_screen.dart';
import 'package:bai_tap_figma1/ui/screen/splash/splash_screen.dart';
import 'package:bai_tap_figma1/ui/screen/storage_details/storage_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '404.dart';
import 'package:page_transition/page_transition.dart';

class DataBundle{
String? id ;
DataBundle({this.id});
}

class RouterGenerator{
  static const routeHome = "/home";
  static const routeLogin = "/login";
  static const routeCreateAccount = '/createAccount';
  static const routeSplash = "/splash";
  static const routeMenu = "/menu";
  static const routeProfile = "/profile";
  static const routeSetting =  "/settings";
  static const routeStorageDetail = "/storage";
  static const routeChangePassword = "/changepassword";

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case routeSplash:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_)=> const LoginScreen());
      case routeCreateAccount:
        return PageTransition(
            child: CreateAccountScreen(),
            type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 400)
        );
      case routeHome:
        return MaterialPageRoute(builder: (_)=> const HomeScreen());
      case routeMenu:
        return PageTransition(
            child: SideMenuScreen(),
            type: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: 500)
        );
      case routeProfile:
        return MaterialPageRoute(builder: (_)=> const ProfileScreen());
      case routeSetting:
        return MaterialPageRoute(builder: (_)=> const SettingScreen());
      case routeStorageDetail:
        return MaterialPageRoute(builder: (_)=> const StorageScreen());
      case routeChangePassword:
        return MaterialPageRoute(builder: (_)=> const ChangePasswordScreen());

    }
    return MaterialPageRoute(builder: (_)=> WidgetNotFound() );
  }
}