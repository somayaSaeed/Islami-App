import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../utils/colors/colors.dart';
import '../../providers/app_language_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfig = Provider.of<AppConfigProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/islamradio.png'),
        const SizedBox(
          height: 30,
        ),
        Text(
          AppLocalizations.of(context)!.radio,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 35,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_next,
              color: appConfig.appTheme == ThemeMode.dark
                  ? ColorsApp.BrownColor
                  : ColorsApp.yellow,
              size: 50,
            ),
            const SizedBox(
              width: 40,
            ),
            Icon(
              Icons.play_arrow,
              color: appConfig.appTheme == ThemeMode.dark
                  ? ColorsApp.BrownColor
                  : ColorsApp.yellow,
              size: 50,
            ),
            const SizedBox(
              width: 40,
            ),
            Icon(
              Icons.skip_previous,
              color: appConfig.appTheme == ThemeMode.dark
                  ? ColorsApp.BrownColor
                  : ColorsApp.yellow,
              size: 50,
            ),
          ],
        )
      ],
    );
  }
}
