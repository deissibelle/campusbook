/*
This is signup page

include file in reuseable/global_function.dart to call function from GlobalFunction

install plugin in pubspec.yaml
- fluttertoast => to show toast (https://pub.dev/packages/fluttertoast)

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:campusbook/config/constants.dart';
import 'package:campusbook/config/global_style.dart';
import 'package:campusbook/ui/bottom_navigation_bar.dart';
import 'package:campusbook/ui/authentication/signup/signup_email_choose_verification.dart';
import 'package:campusbook/ui/authentication/signup/signup_phone_number_choose_verification.dart';
import 'package:campusbook/ui/reuseable/app_localizations.dart';
import 'package:campusbook/ui/reuseable/global_function.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // initialize global function
  final _globalFunction = GlobalFunction();

  bool _buttonDisabled = true;
  String _validate = '';
  TextEditingController _etUsername = TextEditingController();

  TextEditingController _etEmailPhone = TextEditingController();
  TextEditingController _etPassword = TextEditingController();
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _etEmailPhone.dispose();
    _etUsername.dispose();
    _etPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.fromLTRB(30, 120, 30, 30),
      children: <Widget>[
        
        const SizedBox(
          height: 20,
        ),
        Text(AppLocalizations.of(context)!.translate('signup')!,
            style: GlobalStyle.authTitle),
        TextField(
          obscureText: _obscureText,
          style: TextStyle(color: CHARCOAL),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR, width: 2.0)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCCCCCC)),
            ),
            labelText: AppLocalizations.of(context)!.translate('username')!,
            labelStyle: TextStyle(color: BLACK_GREY),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _etEmailPhone,
          style: TextStyle(color: CHARCOAL),
          onChanged: (textValue) {
            setState(() {
              if (_globalFunction.validateMobileNumber(textValue)) {
                _buttonDisabled = false;
                _validate = 'phonenumber';
              } else if (_globalFunction.validateEmail(textValue)) {
                _buttonDisabled = false;
                _validate = 'email';
              } else {
                _buttonDisabled = true;
              }
            });
          },
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: PRIMARY_COLOR, width: 2.0)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCCCCCC)),
              ),
              labelText: AppLocalizations.of(context)!.translate('email')!,
              labelStyle: TextStyle(color: BLACK_GREY)),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: _obscureText,
          style: TextStyle(color: CHARCOAL),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR, width: 2.0)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCCCCCC)),
            ),
            labelText: AppLocalizations.of(context)!.translate('password')!,
            labelStyle: TextStyle(color: BLACK_GREY),
            suffixIcon: IconButton(
                icon: Icon(_iconVisible, color: Colors.grey[400], size: 20),
                onPressed: () {
                  _toggleObscureText();
                }),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) =>
                      states.contains(MaterialState.disabled)
                          ? Colors.grey[300]!
                          : _buttonDisabled
                              ? Colors.grey[300]!
                              : PRIMARY_COLOR,
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                )),
              ),
              onPressed: () {
                if (!_buttonDisabled) {
                  if (_validate == 'email') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignupEmailChooseVerificationPage(
                                    email: _etEmailPhone.text)));
                    FocusScope.of(context).unfocus();
                  } else if (_validate == 'phonenumber') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignupPhoneNumberChooseVerificationPage(
                                    phoneNumber: _etEmailPhone.text)));
                    FocusScope.of(context).unfocus();
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  AppLocalizations.of(context)!.translate('register')!,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _buttonDisabled ? Colors.grey[600] : Colors.white),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context)!.translate('or_signup_with')!,
            style: GlobalStyle.authSignWith,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationBarPage()),
                      (Route<dynamic> route) => false);
                  Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!
                          .translate('signup_google')!,
                      toastLength: Toast.LENGTH_LONG);
                },
                child: Image(
                  image: AssetImage("assets/images/google.png"),
                  width: 40,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationBarPage()),
                      (Route<dynamic> route) => false);
                  Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!
                          .translate('signup_facebook')!,
                      toastLength: Toast.LENGTH_LONG);
                },
                child: Image(
                  image: AssetImage("assets/images/facebook.png"),
                  width: 40,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationBarPage()),
                      (Route<dynamic> route) => false);
                  Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!
                          .translate('signup_twitter')!,
                      toastLength: Toast.LENGTH_LONG);
                },
                child: Image(
                  image: AssetImage("assets/images/twitter.png"),
                  width: 40,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              FocusScope.of(context).unfocus();
            },
            child: Wrap(
              children: [
                Text(
                  AppLocalizations.of(context)!.translate('already_member')!,
                  style: GlobalStyle.authBottom1,
                ),
                Text(
                  AppLocalizations.of(context)!.translate('login')!,
                  style: GlobalStyle.authBottom2,
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
