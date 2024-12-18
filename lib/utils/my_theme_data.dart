import 'package:flutter/material.dart';
import 'package:islami/utils/app_styles.dart';

import 'app_colors.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: AppColors.primaryDark,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryDark)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        showSelectedLabels: true,
        selectedLabelStyle: AppStyles.bold14White),
  );
}
