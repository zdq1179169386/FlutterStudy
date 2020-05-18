import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/global.dart';
import 'package:flutter_github_app/generated/l10n.dart';
import 'package:flutter_github_app/page/language_page.dart';
import 'package:flutter_github_app/page/theme_page.dart';
import 'package:flutter_github_app/state/locale_state.dart';
import 'package:flutter_github_app/state/theme_state.dart';
import 'package:flutter_github_app/state/user_state.dart';
import 'package:flutter_github_app/page/main_page.dart';
import 'package:flutter_github_app/page/login_page.dart';
import 'package:flutter_github_app/page/welcome_page.dart';
import 'package:flutter_github_app/page/setting_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


void main() => Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<UserState>.value(value: UserState()),
      ChangeNotifierProvider<ThemeState>.value(value: ThemeState()),
      ChangeNotifierProvider<LocaleState>.value(value: LocaleState()),
    ],
      child: Consumer2<ThemeState,LocaleState> (
          builder: (BuildContext context,themeState,localeState,Widget child) {
            print("rebuild theme:" + themeState.theme.toString() +";locale:"+ localeState.locale.toString());
            return MaterialApp(
              onGenerateTitle: (context) {
                return S.of(context).title;
              },
              theme: ThemeData(
                primarySwatch: themeState.theme,
              ),
              home: new WelcomePage(),
              routes: <String, WidgetBuilder>{
                LoginPage.pageName: (context) => new LoginPage(),
                MainPage.pageName: (context) => new MainPage(),
                SettingPage.pageName: (context) => new SettingPage(),
                ThemePage.pageName: (context) => new ThemePage(),
                LanguagePage.pageName: (context) => new LanguagePage(),
              },
              locale: localeState.getLocale(),
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                S.delegate,
              ],
              localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
                if (localeState.getLocale() != null){
                  //不跟选系统
                  print("return:"+localeState.getLocale().toString());
                  return localeState.getLocale();
                } else{
                  Locale _locale;
                  if (supportedLocales.contains(locale)) {
                    _locale = locale;
                  } else{
                    _locale =  Locale("en","US");
                  }
                  print("return:"+_locale.toString());
                  return _locale;
                }
              },
            );
          }
      ),
    );
  }
}


