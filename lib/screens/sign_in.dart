import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_bill/ViewModels/auth_view_model.dart';
import 'package:two_bill/ViewModels/base_model.dart';
import 'package:two_bill/services/base_view.dart';
import 'package:two_bill/utils/app_localizations.dart';
import 'package:two_bill/utils/colors.dart';

import 'forget_password_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => new _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    final forgotLabel = Align(
        alignment: FractionalOffset.bottomCenter,
        child: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            text: AppLocalizations.of(context)
                .translate('by_continuing'),
            style: TextStyle(color: Colors.grey),
            children: <TextSpan>[
              new TextSpan(
                  text: AppLocalizations.of(context)
                      .translate('terms_conditions'),
                  style: new TextStyle(
                    decoration: TextDecoration.underline,
                      color: AppColor.appPrimaryColor
                  )),
              new TextSpan(text: AppLocalizations.of(context)
                  .translate('and')),
              new TextSpan(
                text: AppLocalizations.of(context)
                    .translate('privacy_policy'),
                style: new TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColor.appPrimaryColor
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () => print('Tap Here onTap'),
              ),
            ],
          ),
        ));

    return BaseView<AuthViewModel>(
        builder: (context, model, child) => LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return Stack(
            children: [
              Image.asset(
                "images/blur_bg.jpg",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Scaffold(
                backgroundColor: Colors.white,
                key: _scaffoldKey,
                body: Container(
                  padding:
                  EdgeInsets.only(left: 24.0, right: 24.0, top: 16),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.minHeight,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                "images/logo.png",
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                  AppLocalizations.of(context)
                                      .translate('sign_in'),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color(0xff414c5b), fontSize: 24)),
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              autofocus: false,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(
                                    'images/icon_mail.svg',
                                    height: 5.0,
                                    width: 5.0,
                                    color: AppColor.appPrimaryColor,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                                // errorText: model.emailValidate
                                //     ? null
                                //     : AppLocalizations.of(context)
                                //     .translate('email_error'),
                                hintText: AppLocalizations.of(context)
                                    .translate('email'),
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.fromLTRB(
                                    20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0)),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              autofocus: false,
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(
                                    'images/icon_padlock.svg',
                                    height: 5.0,
                                    width: 5.0,
                                    color: AppColor.appPrimaryColor,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                                hintText: AppLocalizations.of(context)
                                    .translate('password'),
                                errorText: model.passwordValidate
                                    ? null
                                    : AppLocalizations.of(context)
                                    .translate('empty_error'),
                                fillColor: Colors.white,
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                    20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0)),
                              ),
                            ),
                            SizedBox(height: 24.0),
                            model.state == ViewState.Busy
                                ? CircularProgressIndicator(
                              backgroundColor: AppColor.appPrimaryColor,
                            )
                                : Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.0),
                              child: ButtonTheme(
                                minWidth:
                                MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  onPressed: ()  {
                                  },
                                  padding: EdgeInsets.all(20),
                                  color: AppColor.appPrimaryColor,
                                  child: Text(
                                      AppLocalizations.of(context)
                                          .translate('login'),
                                      style: TextStyle(
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen()),
                                        (Route<dynamic>
                                    route) =>
                                    false);
                              },
                              child: Text(
                                  AppLocalizations.of(context)
                                      .translate('forget_password'),
                                  style: new TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: AppColor.appPrimaryColor)),
                            ),
                            SizedBox(height: 40.0),
                            forgotLabel,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
