import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/time/time_tab.dart';
import 'package:islami/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '0';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    'assets/images/quran_bg.png',
    'assets/images/hadeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(backgroundImages[selectedIndex])
        Image.asset(
          'assets/images/${getBackgroundImage()}.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryDark),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                // backgroundColor: AppColors.primaryDark,
                // type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 0, imageName: 'icon_quran'),
                      label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 1, imageName: 'icon_hadeth'),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 2, imageName: 'icon_sebha'),
                      label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 3, imageName: 'icon_radio'),
                      label: 'Radio'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 4, imageName: 'icon_time'),
                      label: 'Time'),
                ]),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  Widget builtItemInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor),
            child: ImageIcon(
              AssetImage('assets/images/$imageName.png'),
            ))
        : ImageIcon(
            AssetImage('assets/images/$imageName.png'),
          );
  }

  String getBackgroundImage() {
    switch (selectedIndex) {
      case 0:
        return 'quran_bg';
      case 1:
        return 'hadeth_bg';
      case 2:
        return 'sebha_bg';
      case 3:
        return 'radio_bg';
      case 4:
        return 'time_bg';
      default:
        return 'quran_bg';
    }
  }
}
