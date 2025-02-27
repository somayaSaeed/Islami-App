import 'package:flutter/material.dart';
import 'package:islamproject/utils/colors/colors.dart';
import 'package:islamproject/screens/Quran/sura.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart'; 

class Qurantab extends StatelessWidget {
  final List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  final List<int> versesNumber = [
    7,
    286,
    200,
    176,
    120,
    165,
    206,
    75,
    129,
    109,
    123,
    111,
    43,
    52,
    99,
    128,
    111,
    110,
    98,
    135,
    112,
    78,
    118,
    64,
    77,
    227,
    93,
    88,
    69,
    60,
    34,
    30,
    73,
    54,
    45,
    83,
    182,
    88,
    75,
    85,
    54,
    53,
    89,
    59,
    37,
    35,
    38,
    29,
    18,
    45,
    60,
    49,
    62,
    55,
    78,
    96,
    29,
    22,
    24,
    13,
    14,
    11,
    11,
    18,
    12,
    12,
    30,
    52,
    52,
    44,
    28,
    28,
    20,
    56,
    40,
    31,
    50,
    40,
    46,
    42,
    29,
    19,
    36,
    25,
    22,
    17,
    19,
    26,
    30,
    20,
    15,
    21,
    11,
    8,
    5,
    19,
    5,
    8,
    8,
    11,
    11,
    8,
    3,
    9,
    5,
    4,
    6,
    3,
    6,
    3,
    5,
    4,
    5,
    6
  ];

  Qurantab({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfig = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/sura (1).png'),
          const SizedBox(height: 10),
          Divider(
            color: appConfig.appTheme == ThemeMode.dark
      ? ColorsApp.BrownColor
      : ColorsApp.yellow,
            thickness: 1.3,
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.sura_name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.ayah_number,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: appConfig.appTheme == ThemeMode.dark
      ? ColorsApp.BrownColor
      : ColorsApp.yellow,
            thickness: 1.3,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suraNames.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Sura(
                                    arguments: SuraDetailsArg(
                                        name: suraNames[index], index: index),
                                  ),
                                ));
                              },
                              child: Text(
                                suraNames[index],
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              versesNumber[index].toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: appConfig.appTheme == ThemeMode.dark
                          ? ColorsApp.BrownColor
                          : ColorsApp.yellow,
                      thickness: 0.2,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
