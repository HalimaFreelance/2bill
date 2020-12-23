import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:two_bill/screens/sign_in.dart';
import 'package:two_bill/utils/app_localizations.dart';
import 'package:two_bill/utils/colors.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
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
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/logo.png",
//                      height: MediaQuery.of(context).size.height/10,
//                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("2 Bill",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff414c5b),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(AppLocalizations.of(context).translate('quick_payment'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff414c5b),
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
                        AppLocalizations.of(context).translate('you_can_pay'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff555555),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                            // Navigator.push(
                            //     context,
                            //     new MaterialPageRoute(
                            //         builder: (context) => new OnBoardingPage()));
                          },
                          padding: EdgeInsets.all(20),
                          color: AppColor.appPrimaryColor,
                          child: Text(
                              AppLocalizations.of(context).translate('create_account'),
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        text:
                        AppLocalizations.of(context).translate('already_have'),
                        style:  new TextStyle(
                            color: Colors.black
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                            text: AppLocalizations.of(context)
                                .translate('login'),
                            style: new TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColor.appPrimaryColor
                            ),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignInScreen()),
                                        (Route<dynamic>
                                    route) =>
                                    false);
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
