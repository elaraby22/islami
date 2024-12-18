import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  List<String> azkarList = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int counter = 0;
  double turns = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset('assets/images/sebha_bg.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/logo.png'),
              Image.asset('assets/images/text.png'),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            turns += 1 / 30;
                            changeZekr();
                            setState(() {});
                          },
                          child: AnimatedRotation(
                              turns: turns,
                              duration: Duration(milliseconds: 300),
                              child: Image.asset('assets/images/sebha.png'))),
                      Column(
                        children: [
                          Text(
                            '${azkarList[index]}',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$counter',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void changeZekr() {
    counter++;
    if (index == 0 && counter == 34) {
      index = 1;
    } else if (index == 1 && counter == 67) {
      index = 2;
    } else if (index == 2 && counter == 100) {
      index = 0;
      counter = 0;
    }
  }
}
