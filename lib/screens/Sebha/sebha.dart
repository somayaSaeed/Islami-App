import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart'; // إضافة

import '../../utils/colors/colors.dart';
import '../../providers/app_language_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> doaa = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    final appConfig = Provider.of<AppConfigProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    appConfig.appTheme == ThemeMode.dark
                        ? 'assets/images/head of seb7a.png'
                        : 'assets/images/head of seb7a dark.png',
                    height: 100,
                  )),
            ),
            GestureDetector(
              onTap: () {
                counterMethode();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Align(
                    alignment: Alignment.center,
                    child: AnimatedRotation(
                      turns: angle,
                      duration: const Duration(milliseconds: 200),
                      child: Image.asset(
                        appConfig.appTheme == ThemeMode.dark
                            ? 'assets/images/body of seb7a.png'
                            : 'assets/images/body of seb7a dark.png',
                      ),
                    )),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          AppLocalizations.of(context)!.counter,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
                color: appConfig.appTheme == ThemeMode.dark
                    ? ColorsApp.BrownColor
                    : ColorsApp.yellow,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
                color: appConfig.appTheme == ThemeMode.dark
                    ? const Color(0x99B7935F)
                    : ColorsApp.primaryColor2,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                doaa[index],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        )
      ],
    );
  }

  void counterMethode() {
    setState(() {
      angle += pi * 2;
    });

    if (counter == 33) {
      counter = 0;
      if (index < doaa.length - 1) {
        index++;
      } else {
        index = 0;
      }
    } else {
      counter++;
    }
    setState(() {});
  }
}
