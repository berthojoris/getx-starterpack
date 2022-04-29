import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/apps/muvi/splash.jpg'),
            ),
          ),
          Center(
            child: Padding(
              padding: FxSpacing.fromLTRB(40, 100, 40, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.h5(
                    'Watch your favourite movies anytime, anywhere',
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontWeight: 700,
                  ),
                  FxButton.block(
                    onPressed: () {
                      controller.goToLoginScreen();
                    },
                    backgroundColor: const Color(0xa4161616),
                    borderRadiusAll: 4,
                    elevation: 0,
                    child: FxText.b1(
                      'Log In',
                      fontWeight: 700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
