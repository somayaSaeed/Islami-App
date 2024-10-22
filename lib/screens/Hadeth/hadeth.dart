import 'package:flutter/material.dart';
import 'package:islamproject/utils/colors/colors.dart';
import 'package:islamproject/screens/Hadeth/ahadethcontent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../providers/app_language_provider.dart';

class HadethTab extends StatelessWidget {
  final List<String> ahadith = [
    'الحديث الأول',
    'الحديث الثاني',
    'الحديث الثالث',
    'الحديث الرابع',
    'الحديث الخامس',
    'الحديث السادس',
    'الحديث السابع',
    'الحديث الثامن',
    'الحديث التاسع',
    'الحديث العاشر',
    'الحديث الحادي عشر',
    'الحديث الثاني عشر',
    'الحديث الثالث عشر',
    'الحديث الرابع عشر',
    'الحديث الخامس عشر',
    'الحديث السادس عشر',
    'الحديث السابع عشر',
    'الحديث الثامن عشر',
    'الحديث التاسع عشر',
    'الحديث العشرون',
    'الحديث الحادي والعشرون',
    'الحديث الثاني والعشرون',
    'الحديث الثالث والعشرون',
    'الحديث الرابع والعشرون',
    'الحديث الخامس والعشرون',
  ];

  HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfig = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/hadeth_logo.png'),
          const SizedBox(height: 10),
          Divider(
            color: appConfig.appTheme == ThemeMode.dark
                ? ColorsApp.BrownColor
                : ColorsApp.yellow,
            thickness: 1.3,
          ),
          Text(
            AppLocalizations.of(context)!.hadith_name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Divider(
            color: appConfig.appTheme == ThemeMode.dark
                ? ColorsApp.BrownColor
                : ColorsApp.yellow,
            thickness: 1.3,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ahadith.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AhadethContent(
                          arguments: AhadethDetailsArg(
                              name: ahadith[index], index: index),
                        ),
                      ));
                    },
                    child: Column(
                      children: [
                        Text(
                          ahadith[index],
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          color: appConfig.appTheme == ThemeMode.dark
      ? ColorsApp.BrownColor
      : ColorsApp.yellow,
                          thickness: 0.2,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Class to pass arguments to the next screen
class AhadethDetailsArg {
  final String name;
  final int index;

  AhadethDetailsArg({required this.name, required this.index});
}
