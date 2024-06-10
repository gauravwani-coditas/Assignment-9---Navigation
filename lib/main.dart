import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:routing/core/di/di.dart';
import 'package:routing/core/firebase/notifications.dart';
import 'package:routing/core/routes/app_routes.dart';
import 'package:routing/core/utils/constants.dart';
import 'package:routing/core/firebase/database_services.dart';
import 'package:routing/features/intro/presentation/blocs/bloc/intro_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routing/features/settings/presentation/bloc/locale/locale_bloc.dart';
import 'package:routing/features/settings/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:routing/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setDi();
  DatabaseService();
  await PushNotifications().initNotifications();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('en');
  bool isLogin = false;

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
    super.initState();
    checkLogin();
    getLocale();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IntroBloc()..add(SplashScreenEvent()),
          ),
          BlocProvider(
            create: (context) => LocaleBloc(),
          ),
          BlocProvider(
            create: (context) => UserBloc()..add(UserDataEvent()),
          )
        ],
        child: BlocBuilder<LocaleBloc, LocaleState>(

          builder: (context, state) {
            Locale locale;
            if (state is CurrentLocaleState) {
             locale = state.locale;
            } else {
              locale = _currentLocale;
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MaterialApp.router(
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                locale: locale,
                supportedLocales: const [
                  Locale('en'),
                  Locale('hi'),
                  Locale('mr'),
                  Locale('ar'),
                ],
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter(isLogin: isLogin).config(),
              ),
            );
          },
        ));
  }
}
