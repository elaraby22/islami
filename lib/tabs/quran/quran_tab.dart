import 'package:flutter/material.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/quran/sura_list_widget.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraArabicName: SuraModel.suraArabicNameList[i],
          suraEnglishName: SuraModel.suraEnglishNameList[i],
          numOfVerses: SuraModel.numOfVersesList[i],
          index: i + 1));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();
    loadLastSura();
  }

  List<SuraModel> filterList = SuraModel.suraList;
  String searchText = '';

  // List<SuraModel> searchResultList = [];
  Map<String, String> lastSura = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/logo.png'),
          TextField(
            style: const TextStyle(color: AppColors.whiteColor),
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                      const BorderSide(color: AppColors.primaryDark, width: 2)),
              focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                      const BorderSide(color: AppColors.primaryDark, width: 2)),
              prefixIcon: const ImageIcon(
                  color: AppColors.primaryDark,
                    AssetImage('assets/images/icon_search.png')),
                hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
            ),
            onChanged: (text) {
              searchText = text;
              filterList = SuraModel.suraList.where((sura) {
                return sura.suraArabicName.contains(searchText) ||
                    sura.suraEnglishName
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          searchText.isNotEmpty ? const SizedBox() : builtMostRecently(),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Sura List',
            style: AppStyles.bold16White,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return const Divider(
                color: AppColors.whiteColor,
                thickness: 2,
                indent: 30.5,
                endIndent: 25.5,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  saveLastSura(
                      suraEnName: filterList[index].suraEnglishName,
                      suraArName: filterList[index].suraArabicName,
                      numOfVerses: filterList[index].numOfVerses);
                  Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                      arguments:
                          // searchResultList.isNotEmpty?
                          //     searchResultList[index]
                          // :
                          filterList[index]);
                },
                child: SuraListWidget(
                    // index: index,
                    suraModel:
                        // searchResultList.isNotEmpty?
                        //     searchResultList[index]
                        //     :
                        filterList[index]),
              );
            },
            itemCount:
                // searchResultList.isNotEmpty?
                //     searchResultList.length
                // :
                filterList.length,
          ))
        ],
      ),
    );
  }

  Widget builtMostRecently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Recently',
          style: AppStyles.bold16White,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lastSura['suraEnName'] ?? '',
                    style: AppStyles.bold24Black,
                  ),
                  Text(
                    lastSura['suraArName'] ?? '',
                    style: AppStyles.bold24Black,
                  ),
                  Text(
                    '${lastSura['numOfVerses'] ?? ''} Verses',
                    style: AppStyles.bold14Black,
                  ),
                ],
              ),
              Image.asset('assets/images/most_recently.png')
            ],
          ),
        ),
      ],
    );
  }

  Future<void> saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numOfVerses', numOfVerses);
    await loadLastSura();
  }

  Future<Map<String, String>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String suraArName = prefs.getString('suraArName') ?? '';
    String numOfVerses = prefs.getString('numOfVerses') ?? '';
    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numOfVerses': numOfVerses
    };
  }

  loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {});
  }
}
