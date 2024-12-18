import 'package:flutter/material.dart';
import 'package:islami/utils/app_styles.dart';

import '../../model/sura_model.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;

  // int index;

  SuraListWidget({required this.suraModel});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector_image.png'),
            Text(
              '${suraModel.index}',
              style: AppStyles.bold16White,
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraModel.suraEnglishName,
                    style: AppStyles.bold20White,
                  ),
                  Text(
                    '${suraModel.numOfVerses} Verses',
                    style: AppStyles.bold14White,
                  ),
                ],
              ),
              Text(
                suraModel.suraArabicName,
                style: AppStyles.bold20White,
              )
            ],
          ),
        )
      ],
    );
  }
}
