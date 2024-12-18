import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Stack(
      children: [
        Image.asset('assets/images/radio_bg.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/logo.png'),
            TabBar(
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryDark),
              controller: tabController,
              labelPadding: EdgeInsets.symmetric(horizontal: 30),
              tabs: [
                Tab(
                  child: Text(
                    'Radio',
                    style: TextStyle(color: AppColors.blackColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'Reciters',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
