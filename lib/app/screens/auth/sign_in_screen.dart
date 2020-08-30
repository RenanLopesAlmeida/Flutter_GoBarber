import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gobarber/app/controllers/auth/auth_controller.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';

class SignInScreen extends StatefulWidget {
  static final routeName = '/signIn';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  AuthController _authController;
  Map<String, String> _authData = {
    'name': '',
    'email': '',
    'password': '',
  };

  @override
  void initState() {
    _authController = AuthController();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    _formKey.currentState.save();

    _authController.login(
      _authData['email'],
      _authData['password'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.backgroundDark,
            ),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: _emailFocusNode,
                style: TextStyle(
                  color: Colors.white,
                ),
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                onSaved: (newValue) {
                  _authData['email'] = newValue;
                },
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: !_emailFocusNode.hasFocus
                        ? CustomColors.grey
                        : CustomColors.primary,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: _emailFocusNode.hasFocus
                        ? CustomColors.primary
                        : CustomColors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.backgroundDark,
            ),
            child: Center(
              child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                focusNode: _passwordFocusNode,
                style: TextStyle(
                  color: Colors.white,
                ),
                onSaved: (newValue) {
                  _authData['password'] = newValue;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: !_passwordFocusNode.hasFocus
                        ? CustomColors.grey
                        : CustomColors.primary,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: _passwordFocusNode.hasFocus
                        ? CustomColors.primary
                        : CustomColors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 20,
                  fontFamily: 'RobotoSlab-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: _handleSubmit,
              color: CustomColors.primary,
            ),
          ),
          SizedBox(height: 10),
          FlatButton(
            child: Text('Forgot Password',
                style: TextStyle(
                  color: CustomColors.white,
                )),
            onPressed: () {
              print(_authController.isAuthenticated);
            },
          )
        ],
      ),
    );
  }
}
