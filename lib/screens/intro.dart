
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:two_bill/screens/start_screen.dart';
import 'package:two_bill/utils/app_localizations.dart';
import 'package:two_bill/utils/caching.dart';
import 'package:two_bill/utils/colors.dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                StartScreen()),
            (Route<dynamic>
        route) =>
        false);
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {

    onBoard();
    const bodyStyle =
        TextStyle(fontSize: 19.0, color: AppColor.appPrimaryColor);
    const pageDecoration = const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
            color: AppColor.appPrimaryColor),
        bodyTextStyle: bodyStyle,
        titlePadding: EdgeInsets.only(bottom: 8),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        footerPadding: EdgeInsets.zero,
        imageFlex: 3,
        bodyFlex: 2,
        imagePadding: EdgeInsets.zero);

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          titleWidget: Text("Lorem ipsum Title",
              style: TextStyle(
                  color: Color(0xff414c5b),
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          bodyWidget: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                  " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(
                  color: Color(0xff555555), fontSize: 15)),
          image: Image.asset(
            'images/intro.jpg',
            fit: BoxFit.fill,
          ),
          footer: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  _onIntroEnd(context);
                },
                padding: EdgeInsets.all(20),
                color: AppColor.appPrimaryColor,
                child: Text(
                    AppLocalizations.of(context).translate('continue'),
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Text(AppLocalizations.of(context).translate('intro2_title'),
              style: TextStyle(
                  color: Color(0xff414c5b),
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          bodyWidget: Text(AppLocalizations.of(context).translate('intro2_body'),
              style: TextStyle(
                  color: Color(0xff555555), fontSize: 15)),
          image: Container(
            decoration: new BoxDecoration(
                color: AppColor.lightGreen,
                borderRadius: new BorderRadius.only(
                    bottomRight: const Radius.circular(60.0),
                    bottomLeft: const Radius.circular(60.0))),
            child: Image.asset(
              'images/intro.jpg',
              fit: BoxFit.fill,
            ),
          ),
          footer: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  introKey.currentState?.animateScroll(0);
                  _onIntroEnd(context);
                },
                padding: EdgeInsets.all(20),
                color: AppColor.appPrimaryColor,
                child: Text(
                    AppLocalizations.of(context).translate('continue'),
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Text(AppLocalizations.of(context).translate('intro3_title'),
              style: TextStyle(
                  color: Color(0xff414c5b),
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          bodyWidget: Text(AppLocalizations.of(context).translate('intro3_body'),
              style: TextStyle(
                  color: Color(0xff555555), fontSize: 15)),
          image: Container(
            decoration: new BoxDecoration(
                color: AppColor.lightGreen,
                borderRadius: new BorderRadius.only(
                    bottomRight: const Radius.circular(60.0),
                    bottomLeft: const Radius.circular(60.0))),
            child: Image.asset(
              'images/intro.jpg',
              fit: BoxFit.fill,
            ),
          ),
          footer: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  _onIntroEnd(context);
                },
                padding: EdgeInsets.all(20),
                color: AppColor.appPrimaryColor,
                child: Text(
                    AppLocalizations.of(context).translate('continue'),
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Container(
        // decoration: BoxDecoration(
        //     color: Color(0xFFE2F0EF),
        //     borderRadius: BorderRadius.all(Radius.circular(10))),
        // child: Padding(
        //   padding:
        //       const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20, right: 20),
        //   child: Text(
        //     'Skip',
        //     style: TextStyle(
        //         color: Theme.of(context).primaryColor, fontSize: 12.0),
        //   ),
        // ),
      ),
      next: Container(
        // decoration: BoxDecoration(
        //     color: Color(0xFFE2F0EF),
        //     borderRadius: BorderRadius.all(Radius.circular(10))),
        // child: Padding(
        //   padding:
        //       const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20, right: 20),
        //   child: Text(
        //     'Next',
        //     style: TextStyle(
        //         color: Theme.of(context).primaryColor, fontSize: 12.0),
        //   ),
        // ),
      ),
      done: Container(
        // decoration: BoxDecoration(
        //     color: Color(0xFFE2F0EF),
        //     borderRadius: BorderRadius.all(Radius.circular(10))),
        // child: Padding(
        //   padding:
        //   const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20, right: 20),
        //   child: Text(
        //     'Done',
        //     style: TextStyle(
        //         color: Theme.of(context).primaryColor, fontSize: 12.0),
        //   ),
        // ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: AppColor.appPrimaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
