import 'package:flutter/material.dart';
import 'package:islami/model/hadeth_model.dart';
import 'package:islami/utils/app_styles.dart';

import '../../utils/app_colors.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              'assets/images/details_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 17,
              ),
              Text(args.title, style: AppStyles.bold24Primary),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 22),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 4),
                      child: Text(args.content[index],
                          style: AppStyles.bold20Primary),
                    );
                  },
                  itemCount: args.content.length,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
