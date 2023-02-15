import 'package:bai_tap_figma1/ui/router/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserName()),
        ChangeNotifierProvider(create: (_) => Password()),
      ],
    child: MyApp(),
  ));
}

class Password extends ChangeNotifier{
  String _passWord = '';
  get passWord => _passWord;
  void setPassword(value){
    _passWord = value;
    notifyListeners();
  }
}

class UserName extends ChangeNotifier{
  String? _userName ;
  get userName => _userName;
  void setUserName(value){
    _userName = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouterGenerator.routeSplash,
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}


