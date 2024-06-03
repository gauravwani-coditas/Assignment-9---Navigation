

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routing/core/routes/app_routes.dart';
import 'package:routing/core/utils/constants.dart';
import 'package:routing/features/settings/bloc/locale_bloc.dart';
import 'package:routing/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Map<String, String> languages = {
  'English': 'en',
  'Hindi': 'hi',
  'Marathi': 'mr',
  'Arabic': 'ar'
};

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  String? userName;
  String? currentLanguageCode;

  Future<void> _selectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    currentLanguageCode = prefs.getString(Constants.KEY_LANGUAGE_CODE) ?? 'en';
    setState(() {});
  }

  Future<void> _changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.KEY_LANGUAGE_CODE, languageCode);
    context.read<LocaleBloc>().add(OnLocaleChangedEvent(locale: Locale(languageCode) ));
    setState(() {
      currentLanguageCode = languageCode;
    });
    
  }

  Future<void> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(Constants.KEY_USERNAME)!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserName();
    _selectedLanguage();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              userName!,
              style:
                  GoogleFonts.heebo(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              AppLocalizations.of(context)!.language,
              style:
                  GoogleFonts.heebo(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: languages.length,
            itemBuilder: (context, index) {
              String languageName = languages.keys.elementAt(index);
              String languageCode = languages.values.elementAt(index);

              return ListTile(
                title: Text(languageName),

                leading: Radio<String>(
                  value: languageCode,
                  groupValue: currentLanguageCode,
                  onChanged: (value) {
                    _changeLanguage(value!);
                  },
                ),
              );
            },
          ),
          TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool(Constants.KEY_LOGIN, false);
                AutoRouter.of(context).replace(SignInRoute());
              },
              child: const Text("Logout")),
        ],
      ),
    );
  }
}

Future<String> getUserName() async {
  final prefs = await SharedPreferences.getInstance();
  final userName = prefs.getString(Constants.KEY_USERNAME);
  return userName!;
}
