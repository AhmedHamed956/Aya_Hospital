import 'package:aya_hospital/helpers/app_localizations.dart';
import 'package:aya_hospital/helpers/colors.dart';
import 'package:aya_hospital/screens/splash/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'lang/lang.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppConfig>(
      create: (context) => AppConfig(),
      child: Consumer<AppConfig>(
        builder: (context, appConfig, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: [Locale('ar'), Locale('en')],
            locale: Locale(appConfig.currenLang),
            theme: ThemeData(
                brightness:
                    appConfig.isDark ? Brightness.dark : Brightness.light,
                fontFamily: 'Cairo',
                accentColor: Color(getColorHexFromStr('#811523'))),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: SplashView(),
          );
        },
      ),
    );
  }
}
