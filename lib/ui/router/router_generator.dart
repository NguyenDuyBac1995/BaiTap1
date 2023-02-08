import 'package:bai_tap_figma1/ui/screen/change_password/change_password_screen.dart';
import 'package:bai_tap_figma1/ui/screen/home/home_screen.dart';
import 'package:bai_tap_figma1/ui/screen/login/login_account_screen.dart';
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
  static const routeLoginAcount = "/loginAcount";
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
      case routeLoginAcount:
        if(args is DataBundle){
          return PageTransition(
            child: LoginAcount(id : args.id!),
            type: PageTransitionType.rightToLeft,
            settings: settings,
            duration: Duration(milliseconds: 300),
          );
        }
        break;
      case routeHome:
        return MaterialPageRoute(builder: (_)=> const HomeScreen());
      case routeMenu:
        return MaterialPageRoute(builder: (_)=> const SideMenuScreen() );
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