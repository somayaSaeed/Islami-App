import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamproject/providers/app_language_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);

    final List<String> itemsLanguages = [
      'en',
      'ar',
    ];

    final List<String> itemsThemes = [
      'light',
      'dark',
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.09,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 10),
              child: Text(
                AppLocalizations.of(context)!.language,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
                textAlign: TextAlign.start,
              ),
            ),
            DropdownButtonHideUnderline(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: DropdownButton2(
                  dropdownStyleData: const DropdownStyleData(
                      decoration: BoxDecoration(
                        color: Color(0xFFD4C4AE),
                      )
                  ),
                  isExpanded: true,
                  items: itemsLanguages
                      .map((String langCode) =>
                      DropdownMenuItem<String>(
                        value: langCode,
                        child: Text(
                          langCode == 'en'
                              ? AppLocalizations.of(context)!.item1L
                              : AppLocalizations.of(context)!.item2L,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                      .toList(),
                  value: provider.appLanguage,
                  onChanged: (value) {
                    if (value != null) {
                      provider.changeLanguage(value);
                    }
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 260,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: const Color(0x6EB7935F),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 10),
              child: Text(
                AppLocalizations.of(context)!.theme,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
                textAlign: TextAlign.start,
              ),
            ),
            DropdownButtonHideUnderline(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: DropdownButton2(
                  dropdownStyleData: const DropdownStyleData(
                      decoration: BoxDecoration(
                        color: Color(0xFFD4C4AE),
                      )
                  ),
                  isExpanded: true,
                  items: itemsThemes
                      .map((String themeMode) =>
                      DropdownMenuItem<String>(
                        value: themeMode,
                        child: Text(
                          themeMode == 'dark'
                              ? AppLocalizations.of(context)!.item1T
                              : AppLocalizations.of(context)!.item2T,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                      .toList(),
                  value: provider.appTheme == ThemeMode.light
                      ? 'light'
                      : 'dark',
                  onChanged: (value) {
                    if (value != null) {
                      provider.changeTheme(
                        value == 'light' ? ThemeMode.light : ThemeMode.dark,
                      );
                      // setState() is not needed here as the provider will handle the state change
                    }
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 260,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: const Color(0x6EB7935F),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

