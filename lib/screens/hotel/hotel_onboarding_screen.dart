/*
* File : Hotel Onboarding
* Version : 1.0.0
* */

import 'package:digital/theme/app_theme.dart';
import 'package:digital/theme/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';

import 'hotel_login_screen.dart';

class HotelOnboardingScreen extends StatefulWidget {
  @override
  _HotelOnboardingScreenState createState() => _HotelOnboardingScreenState();
}

class _HotelOnboardingScreenState extends State<HotelOnboardingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  color: theme.backgroundColor,
                  child: FxOnBoarding(
                    pages: <PageViewModel>[
                      PageViewModel(
                        theme.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/hotel/illu-1.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30.0),
                              FxText.b1('Book a Hotel\nfrom Anywhere',
                                  fontWeight: 600),
                              SizedBox(height: 15.0),
                              FxText.b2(
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                  letterSpacing: 0.1,
                                  fontWeight: 500),
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        theme.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/hotel/illu-2.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30.0),
                              FxText.b1('Hotel Facility\nGames',
                                  fontWeight: 600),
                              SizedBox(height: 15.0),
                              FxText.b2(
                                  'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                  letterSpacing: 0.1,
                                  fontWeight: 500),
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        theme.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/hotel/illu-3.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30),
                              FxText.b1('Hotel Facility\nPool',
                                  fontWeight: 600),
                              SizedBox(height: 15.0),
                              FxText.b2(
                                  'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                  letterSpacing: 0.1,
                                  fontWeight: 500),
                            ],
                          ),
                        ),
                      ),
                    ],
                    unSelectedIndicatorColor: theme.colorScheme.secondary,
                    selectedIndicatorColor: theme.colorScheme.primary,
                    doneWidget: InkWell(
                      splashColor: theme.colorScheme.secondary,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HotelLoginScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: FxText.sh2("DONE".toUpperCase(),
                            color: theme.colorScheme.primary, fontWeight: 700),
                      ),
                    ),
                    skipWidget: InkWell(
                      splashColor: theme.colorScheme.secondary,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HotelLoginScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: FxText.sh2("Skip".toUpperCase(),
                            color: theme.colorScheme.secondary,
                            fontWeight: 700),
                      ),
                    ),
                  ))));
    });
  }
}
