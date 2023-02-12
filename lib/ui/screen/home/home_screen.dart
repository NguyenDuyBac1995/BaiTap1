import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:bai_tap_figma1/ui/widget/components/dummy_data.dart';
import 'package:bai_tap_figma1/ui/widget/utils/colors.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widget/components/common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV2(context, strTitle: 'Your Dribbox'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Common().textFromField(
                      hintValue: 'Search Folder',
                      icons: Icon(
                        Icons.search,
                        color: Colos.LOGINTEXT1,
                      )),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Recent',
                            style: TextStyles.textAppBar
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Transform.scale(
                              scale: 1.1,
                              child: SvgPicture.asset('assets/svg/Vector.svg')),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                              scale: 1.4,
                              child: SvgPicture.asset(
                                'assets/svg/3_gach.svg',
                              )),
                          SizedBox(width: 28),
                          Transform.scale(
                              scale: 1.4,
                              child: SvgPicture.asset(
                                'assets/svg/Group 127.svg',
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 150),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 128,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: 10,
                    itemBuilder: (BuildContext ctx, index) {
                      return Common().FolderFont(
                          color: dummyData[index].color,
                          name: dummyData[index].name,
                          date: dummyData[index].date);
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Transform.scale(
        scale: 1.35,
        child: Padding(
          padding: EdgeInsets.only(bottom: 50, right: 30),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colos.LOGINTEXT1,
          ),
        ),
      ),
    );
  }
}
