import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/home/tabs/ThemeBottomSheet.dart';
import 'package:islami_c12_maadi/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

import 'LanguageBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {
              showModalBottomSheet(context: context, builder: (context) =>LanguageBottomSheet(),);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color:Theme.of(context).colorScheme.tertiary,
                  width: 2
                )
              ),
              child: Text(settingsProvider.language=="ar"
                  ?"العربية"
                  :"English",style: TextStyle(
                  fontSize: 20
              )),
            ),
          ),
          SizedBox(height: 20,),
          Text(AppLocalizations.of(context)!.theme,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.tertiary,
                      width: 2
                  )
              ),
              child: Text(settingsProvider.themeMode==ThemeMode.dark
                  ?AppLocalizations.of(context)!.dark
                  :AppLocalizations.of(context)!.light,style: TextStyle(
                  fontSize: 20
              )),
            ),
          )
        ],
      ),
    );
  }
}
