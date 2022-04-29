import 'package:flutter/material.dart';
import 'package:digital/theme/app_theme.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:flutx/flutx.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    late ThemeData theme;
    late CustomTheme customTheme;

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    return Scaffold(
      body: ListView(
        padding: FxSpacing.top(120),
        children: [
          const Image(
            height: 80,
            image: AssetImage('assets/images/apps/muvi/profile.png'),
          ),
          FxSpacing.height(12),
          FxText.b1(
            'Log In',
            fontWeight: 700,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(4),
          FxText.button(
            'Enter your credentials to login yourself.',
            xMuted: true,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(20),
          const Divider(),
          FxSpacing.height(20),
          FxContainer.bordered(
            borderRadiusAll: 4,
            margin: FxSpacing.x(20),
            padding: FxSpacing.y(6),
            child: Column(
              children: [
                FxTextField(
                  maxLines: 1,
                  cursorColor: theme.colorScheme.onBackground,
                  enabledBorderColor: Colors.transparent,
                  focusedBorderColor: Colors.transparent,
                  autoIcon: false,
                  labelText: 'Username',
                  isCollapsed: true,
                  scrollPadding: EdgeInsets.zero,
                  contentPadding: FxSpacing.xy(16, 6),
                  isDense: true,
                  textColor: theme.colorScheme.onBackground,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: FxTextStyle.caption(
                      color: theme.colorScheme.onBackground),
                ),
                const Divider(),
                FxTextField(
                  maxLines: 1,
                  cursorColor: theme.colorScheme.onBackground,
                  enabledBorderColor: Colors.transparent,
                  focusedBorderColor: Colors.transparent,
                  autoIcon: false,
                  labelText: 'Password',
                  isCollapsed: true,
                  scrollPadding: EdgeInsets.zero,
                  contentPadding: FxSpacing.xy(16, 6),
                  isDense: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: FxTextStyle.caption(
                      color: theme.colorScheme.onBackground),
                ),
              ],
            ),
          ),
          FxSpacing.height(20),
          Container(
            margin: FxSpacing.x(20),
            alignment: Alignment.centerRight,
            child: FxButton.text(
              padding: FxSpacing.x(10),
              splashColor: customTheme.muviPrimary.withAlpha(30),
              onPressed: () {
                controller.register();
              },
              child: FxText.caption(
                'Don\'t have an account? ',
                color: customTheme.muviPrimary,
              ),
            ),
          ),
          FxSpacing.height(20),
          Padding(
            padding: FxSpacing.x(30),
            child: FxButton.small(
              onPressed: () {
                controller.login();
              },
              backgroundColor: customTheme.muviPrimary,
              splashColor: customTheme.muviOnPrimary.withAlpha(30),
              elevation: 0,
              borderRadiusAll: 4,
              padding: FxSpacing.y(12),
              child: FxText.b2(
                'Log In',
                fontWeight: 600,
                color: customTheme.muviOnPrimary,
              ),
            ),
          ),
          FxSpacing.height(20),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FxText.caption(
                  'Forgot the magic word?',
                  xMuted: true,
                ),
                FxSpacing.width(8),
                FxButton.text(
                  onPressed: () {
                    controller.forgotPassword();
                  },
                  padding: FxSpacing.zero,
                  splashColor: customTheme.muviPrimary.withAlpha(30),
                  child: FxText.caption(
                    'Forgot Password',
                    fontWeight: 700,
                    color: customTheme.muviPrimary,
                    muted: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
