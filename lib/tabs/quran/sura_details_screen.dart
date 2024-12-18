import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  String contentSura = '';

  @override
  Widget build(BuildContext context) {
    SuraModel args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (contentSura.isEmpty) {
      loadSuraFile1(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(args.suraEnglishName, style: AppStyles.bold20Primary),
      ),
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
              Text(args.suraArabicName, style: AppStyles.bold24Primary),
              Expanded(
                  child: contentSura.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ))
                      : SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              contentSura,
                              style: AppStyles.bold20Primary,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ))
            ],
          )
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent = await rootBundle.loadString('assets/files/$fileName');
    List<String> suraLines = suraContent.split('\n');
    verses = suraLines;
    setState(() {});
  }

  void loadSuraFile1(int index) async {
    String suraContent = await rootBundle.loadString('assets/files/$index.txt');
    List<String> suraLines = suraContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}]';
    }
    contentSura = suraLines.join();
    // verses = suraLines;
    setState(() {});
  }
}
