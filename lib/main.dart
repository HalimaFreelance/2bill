import 'package:flutter/material.dart';
import 'package:two_bill/screens/language_screen.dart';
import 'package:two_bill/services/base_view.dart';
import 'package:two_bill/services/locator.dart';
import 'package:two_bill/utils/AppLanguage.dart';
import 'package:two_bill/utils/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatefulWidget {
  final AppLanguage appLanguage;

  MyApp({this.appLanguage});

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String _login;

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.appLanguage != null)
  //     locator<AppLanguage>().changeLanguage(widget.appLanguage.appLocal);
  //   isLogin().then((value) {
  //     if (value != null) {
  //       _login = "true";
  //       Globals.userData = value;
  //     } else {
  //       _login = "false";
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BaseView<AppLanguage>(
        builder: (context, model, child) => LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return MaterialApp(
            locale: model.appLocal,
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ar', ''),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: '2 bill',
            theme: ThemeData(
                primarySwatch: Colors.grey,
                primaryColor: Color(0xff3864b9),
                visualDensity: VisualDensity.adaptivePlatformDensity,
                inputDecorationTheme: const InputDecorationTheme(
                  labelStyle:
                  TextStyle(color: Colors.white),
                  hintStyle:
                  TextStyle(color: Colors.white),
                )),
            home: LanguageScreen(),
          );
        }));
  }

}



