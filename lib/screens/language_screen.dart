import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_bill/screens/intro.dart';
import 'package:two_bill/utils/AppLanguage.dart';
import 'package:two_bill/utils/app_localizations.dart';
import 'package:two_bill/utils/colors.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);

    return Stack(
      children: [
        Image.asset(
          "images/blur_bg.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.white70,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: (MediaQuery.of(context).size.height/4),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        AppLocalizations.of(context).translate('hello'),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xff555555),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        AppLocalizations.of(context).translate('choose_lang'),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xff555555),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      color: Colors.white,
                      child: ExpansionTile(
                          title: Text(
                            appLanguage.appLocal.languageCode=="en"?
                            AppLocalizations.of(context).translate('english'):
                            AppLocalizations.of(context).translate('arabic'),
                            style: TextStyle(color: Color(0xff555555),
                            ),
                          ),
//                        trailing: Icon(
//                          Icons.arrow_forward_ios,
//                          color: Colors.lightBlue,
//                        ),
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ListTile(
                                  title: Text(
                                    'English',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                        color: appLanguage.appLocal.languageCode=="en"?
                                        Colors.white:AppColor.appPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      appLanguage.changeLanguage(Locale("en"));
                                    });
                                  },
                                ),
                              ),
                              color: appLanguage.appLocal.languageCode=="en"?
                              AppColor.appPrimaryColor:Colors.white,
                            ),
                            Container(
                              color: appLanguage.appLocal.languageCode=="ar"?
                              AppColor.appPrimaryColor:Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        appLanguage.changeLanguage(Locale("ar"));
                                      });
                                    },
                                    title: Text("العربيه",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            color: appLanguage.appLocal.languageCode=="ar"?Colors.white:AppColor.appPrimaryColor,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),

                          ]),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new OnBoardingPage()));
                          },
                          padding: EdgeInsets.all(20),
                          color: AppColor.appPrimaryColor,
                          child: Text(
                              AppLocalizations.of(context).translate('continue'),
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
