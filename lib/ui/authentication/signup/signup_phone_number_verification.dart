/*
This is signup phone number verification page

include file in reuseable/global_function.dart to call function from GlobalFunction

install plugin in pubspec.yaml
- pin_code_fields => to create input field for code verification (https://pub.dev/packages/pin_code_fields)

Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'package:flutter/material.dart';
import 'package:campusbook/config/constants.dart';
import 'package:campusbook/config/global_style.dart';
import 'package:campusbook/ui/authentication/signup/signup_phone_number.dart';
import 'package:campusbook/ui/reuseable/app_localizations.dart';
import 'package:campusbook/ui/reuseable/global_function.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignupPhoneNumberVerificationPage extends StatefulWidget {
  final String verificationType;
  final String phoneNumber;

  const SignupPhoneNumberVerificationPage({Key? key, this.verificationType = 'sms', this.phoneNumber = ''}) : super(key: key);

  @override
  _SignupPhoneNumberVerificationPageState createState() => _SignupPhoneNumberVerificationPageState();
}

class _SignupPhoneNumberVerificationPageState extends State<SignupPhoneNumberVerificationPage> {
  // initialize global function
  final _globalFunction = GlobalFunction();
  bool _buttonDisabled = true;
  String _verificationCode = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(30, 120, 30, 30),
          children: <Widget>[
            Center(
                child: (widget.verificationType == 'wa')
                    ? Image.asset('assets/images/whatsapp.png', height: 50)
                    : Icon(Icons.phone_android, color: PRIMARY_COLOR, size: 50)),
            SizedBox(height: 20),
            Center(
                child: Text(
                  AppLocalizations.of(context)!.translate('enter_verification_code')!,
                  style: GlobalStyle.chooseVerificationTitle,
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                AppLocalizations.of(context)!.translate('enter_verification_code_message2')!+((widget.verificationType=='wa')?AppLocalizations.of(context)!.translate('whatsapp')!:AppLocalizations.of(context)!.translate('sms')!)+' '+AppLocalizations.of(context)!.translate('to')!+' '+widget.phoneNumber,
                style: GlobalStyle.chooseVerificationMessage,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: PinCodeTextField(
                autoFocus: true,
                appContext: context,
                keyboardType: TextInputType.number,
                length: 4,
                showCursor: false,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveColor: SOFT_GREY,
                    activeColor: PRIMARY_COLOR,
                    selectedColor: PRIMARY_COLOR
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                onChanged: (value) {
                  setState(() {
                    if(value.length==4){
                      _buttonDisabled = false;
                    } else {
                      _buttonDisabled = true;
                    }
                    _verificationCode = value;
                  });
                },
                beforeTextPaste: (text) {
                  return false;
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) => states.contains(MaterialState.disabled) ? Colors.grey[300]! : _buttonDisabled?Colors.grey[300]!:PRIMARY_COLOR,
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        )
                    ),
                  ),
                  onPressed: () {
                    if(!_buttonDisabled){
                      print(_verificationCode);
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignupPhoneNumberPage(phoneNumber: widget.phoneNumber)), (Route<dynamic> route) => false);
                      FocusScope.of(context).unfocus();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      AppLocalizations.of(context)!.translate('verify')!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _buttonDisabled?Colors.grey[600]:Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Wrap(
                children: [
                  Text(
                    AppLocalizations.of(context)!.translate('not_receive_code')!,
                    style: GlobalStyle.notReceiveCode,
                  ),
                  GestureDetector(
                    onTap: (){
                      _globalFunction.resendVerification(context, AppLocalizations.of(context)!.translate('resend_verification_message_phone')!);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.translate('resend')!,
                      style: GlobalStyle.resendVerification,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
