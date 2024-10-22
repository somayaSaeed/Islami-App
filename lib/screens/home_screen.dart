import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // إضافة
import 'package:islamproject/utils/colors/colors.dart';
import 'package:islamproject/screens/Hadeth/hadeth.dart';
import 'package:islamproject/screens/Quran/quarn.dart';
import 'package:islamproject/screens/Radio/radio.dart';
import 'package:islamproject/screens/Sebha/sebha.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/app_language_provider.dart';
import 'SettingsTab/SettingsTab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

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
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            buttonBackgroundColor: const Color.fromARGB(0, 255, 255, 255),
            color: navigationColor(appConfig),
            backgroundColor: Colors.transparent,
            items: [
              ImageIcon(
                const AssetImage('assets/images/moshaf_blue.png'),
                color: _selectedIndex == 0
                    ? buttonColor(appConfig)
                    : Colors.white,
              ),
              ImageIcon(
                const AssetImage('assets/images/Group 6.png'),
                color: _selectedIndex == 1
                    ? buttonColor(appConfig)
                    : Colors.white,
              ),
              ImageIcon(
                const AssetImage('assets/images/sebha_blue.png'),
                color: _selectedIndex == 2
                    ? buttonColor(appConfig)
                    : Colors.white,
              ),
              ImageIcon(
                const AssetImage('assets/images/Icon_radio.png'),
                color: _selectedIndex == 3
                    ? buttonColor(appConfig)
                    : Colors.white,
              ),
              Icon(Icons.settings , color: _selectedIndex == 4
                  ? buttonColor(appConfig)
                  : Colors.white,)
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          body: tabs[_selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [Qurantab(), HadethTab(), const SebhaTab(), const RadioTab(), const SettingTab()];
}

Color navigationColor(AppConfigProvider appConfig) {
  return appConfig.appTheme == ThemeMode.dark
      ? ColorsApp.BrownColor
      : ColorsApp.primaryColor;
}

String getImagePath(AppConfigProvider appConfig) {
  return appConfig.appTheme == ThemeMode.dark
      ? 'assets/images/background.png'
      : 'assets/images/bg (1).png';
}

Color buttonColor(AppConfigProvider appConfig) {
  return appConfig.appTheme == ThemeMode.dark
      ? ColorsApp.DarkBrownColor
      : ColorsApp.yellow;
}
