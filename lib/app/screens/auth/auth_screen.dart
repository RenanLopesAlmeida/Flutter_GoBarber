import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/screens/auth/sign_in_screen.dart';
import 'package:flutter_gobarber/app/screens/auth/sign_up_screen.dart';

enum AuthScreenEnum { SIGN_IN, SIGN_UP }

class AuthScreen extends StatefulWidget {
  static final routeName = '/auth_screen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthScreenEnum _currentScreen;

  @override
  void initState() {
    _currentScreen = AuthScreenEnum.SIGN_IN;
    super.initState();
  }

  void _switchAuthScreen() {
    if (_currentScreen == AuthScreenEnum.SIGN_IN) {
      setState(() {
        _currentScreen = AuthScreenEnum.SIGN_UP;
      });
    } else {
      setState(() {
        _currentScreen = AuthScreenEnum.SIGN_IN;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.backgroundDarkLight,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 200,
                    margin: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: (_currentScreen == AuthScreenEnum.SIGN_IN)
                          ? SignInScreen()
                          : SignUpScreen(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: CustomColors.backgroundDark,
                          thickness: 1,
                        ),
                        FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                  (_currentScreen == AuthScreenEnum.SIGN_IN)
                                      ? Icons.exit_to_app
                                      : Icons.chevron_left,
                                  color: CustomColors.primary),
                              SizedBox(width: 20),
                              Text(
                                (_currentScreen == AuthScreenEnum.SIGN_IN)
                                    ? 'Create Account'
                                    : 'Go to Login',
                                style: TextStyle(
                                  color: CustomColors.primary,
                                ),
                              )
                            ],
                          ),
                          onPressed: _switchAuthScreen,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
