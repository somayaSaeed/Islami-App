import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamproject/utils/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../providers/app_language_provider.dart';

class Sura extends StatefulWidget {
  final SuraDetailsArg arguments;

  const Sura({super.key, required this.arguments});

  @override
  State<Sura> createState() => _SuraState();
}

class _SuraState extends State<Sura> {
  List<String> verses = [];

  @override
  void initState() {
    super.initState();
    loadFiles(widget.arguments.index);
  }

  @override
  Widget build(BuildContext context) {
    final appConfig =
        Provider.of<AppConfigProvider>(context); 

    return Stack(
      children: [
        Image.asset(
          appConfig.appTheme == ThemeMode.light
              ? 'assets/images/bg (1).png'
              : 'assets/images/background.png',
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
                            'سورة ${widget.arguments.name}',
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
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Image.asset('assets/images/bsm.png'),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Center(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          ' ${verses[index]}\n(${index + 1})',
                                          style: GoogleFonts.amiriQuran(
                                            fontSize: 23,
                                            color: ColorsApp.DarkBrownColor,
                                          ),
                                        ),
                                      )),
                                  if (index != verses.length - 1)
                                    Divider(
                                      color:
                                          appConfig.appTheme == ThemeMode.dark
                                              ? ColorsApp.BrownColor
                                              : ColorsApp.yellow,
                                      thickness: .4,
                                    ),
                                ],
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

  void loadFiles(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    setState(() {
      verses = lines;
    });
  }
}

/// Data Class
class SuraDetailsArg {
  String name;
  int index;
  SuraDetailsArg({required this.name, required this.index});
}
