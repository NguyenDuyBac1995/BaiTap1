import 'package:flutter/material.dart';

class Folder {
 String name;
 int color;
 String date;

 Folder({ required this.name, required this.color, required this.date});
}

 List<Folder> dummyData = [
  Folder(name: 'Mobile Apps', color: 0xff415EB6, date: 'December 20.2020'),
  Folder(name: 'Svg Icons', color: 0xffFFB110, date: 'December 14.2020'),
  Folder(name: 'Prototypes', color: 0xffAC4141, date: 'Novemaber 22.2020'),
  Folder(name: 'Avatars', color: 0xff23B0B0, date: 'Novemaber 10.2020'),
  Folder(name: 'Design', color: 0xff415EB6, date: 'December 20.2020'),
  Folder(name: 'Portfolio', color: 0xffFFB110, date: 'December 14.2020'),
  Folder(name: 'References', color: 0xffAC4141, date: 'Novemaber 22.2020'),
  Folder(name: 'Clients', color: 0xff23B0B0, date: 'December 20.2020'),
  Folder(name: 'Flutter', color: 0xff415EB6, date: 'December 20.2020'),
  Folder(name: 'Desktop Folder', color: 0xffFFB110, date: 'December 20.2020')
 ];
