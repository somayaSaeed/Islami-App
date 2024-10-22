import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamproject/utils/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';
import 'hadeth.dart';

class AhadethContent extends StatefulWidget {
  final AhadethDetailsArg arguments;

  const AhadethContent({super.key, required this.arguments});

  @override
  State<AhadethContent> createState() => _AhadethContentState();
}

class _AhadethContentState extends State<AhadethContent> {
  List<String> verses = [];

  @override
  void initState() {
    super.initState();
    loadFiles(widget.arguments.index);
  }

  void loadFiles(int index) async {
    String content =
    await rootBundle.loadString('assets/files/new_files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    setState(() {
      verses = lines;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appConfig = Provider.of<AppConfigProvider>(context); // استخدام provider

    return Stack(
      children: [
        Image.asset(
          getImagePath(appConfig),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(117, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.79,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.arguments.name, // Display the name of the hadith
                            style: GoogleFonts.amiriQuran(
                                fontSize: 25, color: ColorsApp.DarkBrownColor),
                          ),
                        ),
                        Divider(
                          color: appConfig.appTheme == ThemeMode.dark
      ? ColorsApp.BrownColor
      : ColorsApp.yellow,
                          thickness: 1.3,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  ' ${verses[index]} ',
                                  textDirection: TextDirection.rtl,
                                  style: GoogleFonts.amiriQuran(
                                      fontSize: 23,
                                      color: ColorsApp.DarkBrownColor),
                                ),
                              );
                            },
                            itemCount: verses.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


String getImagePath(AppConfigProvider appConfig) {
  return appConfig.appTheme == ThemeMode.dark
      ? 'assets/images/background.png'
      : 'assets/images/bg (1).png';
}
