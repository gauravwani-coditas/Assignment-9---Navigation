import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routing/core/routes/app_routes.dart';
import 'package:routing/core/utils/constants.dart';
import 'package:routing/features/intro/presentation/blocs/bloc/intro_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routing/features/settings/bloc/locale_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('en');
  bool? isLogin;

  Future<void> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(Constants.KEY_LANGUAGE_CODE) ?? 'en';
    setState(() {
      _currentLocale = Locale(languageCode);
    });
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool(Constants.KEY_LOGIN) ?? false;
    setState(() {});
  }

  @override
  void initState() {
    checkLogin();
    getLocale();
  }

  @override
  Widget build(BuildContext context) {
    print(isLogin);
    print(isLogin);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IntroBloc()..add(SplashScreenEvent()),
          ),
          BlocProvider(
            create: (context) => LocaleBloc(),
          )
        ],
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) {
           
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: AnimatedSplashScreen(
                  animationDuration: const Duration(seconds: 2),
                  splash: Center(
                    child: SvgPicture.asset(
                        "assets/images/splash_screen_images/coditas_icon.svg"),
                  ),
                  nextScreen: MaterialApp.router(
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    locale:  state is CurrentLocaleState ? state.locale : const Locale('en'),
                    supportedLocales: const [
                      Locale('en'),
                      Locale('hi'),
                      Locale('mr'),
                      Locale('ar'),
                    ],
                    debugShowCheckedModeBanner: false,
                    routerConfig: AppRouter(isLogin: isLogin!).config(),
                  ),
                ),
              );
            
          },
        ));
  }
}
