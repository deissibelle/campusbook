/*
This is account information page

include file in reuseable/global_function.dart to call function from GlobalFunction
include file in reuseable/global_widget.dart to call function from GlobalWidget
include file in reuseable/cache_image_network.dart to use cache image network
 */

import 'package:flutter/material.dart';
import 'package:campusbook/config/constants.dart';
import 'package:campusbook/config/global_style.dart';
import 'package:campusbook/ui/account/account_information/edit_email.dart';
import 'package:campusbook/ui/account/account_information/edit_name.dart';
import 'package:campusbook/ui/account/account_information/edit_phone_number.dart';
import 'package:campusbook/ui/account/account_information/edit_profile_picture.dart';
import 'package:campusbook/ui/reuseable/app_localizations.dart';
import 'package:campusbook/ui/reuseable/cache_image_network.dart';
import 'package:campusbook/ui/reuseable/global_widget.dart';

class AccountInformationPage extends StatefulWidget {
  @override
  _AccountInformationPageState createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: Text(
            AppLocalizations.of(context)!.translate('account_information')!,
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _globalWidget.bottomAppBar(),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createProfilePicture(),
              SizedBox(height: 40),
              Text(
                AppLocalizations.of(context)!.translate('name')!,
                style: GlobalStyle.accountInformationLabel,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Robert Steven',
                      style: GlobalStyle.accountInformationValue,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditNamePage()));
                    },
                    child: Text(AppLocalizations.of(context)!.translate('edit')!, style: GlobalStyle.accountInformationEdit),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.translate('email')!,
                    style: GlobalStyle.accountInformationLabel,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  _verifiedLabel()
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'robert.steven@ijtechnology.net',
                      style: GlobalStyle.accountInformationValue,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditEmailPage()));
                    },
                    child: Text(AppLocalizations.of(context)!.translate('edit')!, style: GlobalStyle.accountInformationEdit),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.translate('phone_number')!,
                    style: GlobalStyle.accountInformationLabel,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  _verifiedLabel()
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '673219684',
                      style: GlobalStyle.accountInformationValue,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditPhoneNumberPage()));
                    },
                    child: Text(AppLocalizations.of(context)!.translate('edit')!, style: GlobalStyle.accountInformationEdit),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }

  Widget _createProfilePicture(){
    final double profilePictureSize = MediaQuery.of(context).size.width/3;
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 40),
        width: profilePictureSize,
        height: profilePictureSize,
        child: GestureDetector(
          onTap: () {
            _showPopupUpdatePicture();
          },
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: (profilePictureSize),
                child: Hero(
                  tag: 'profilePicture',
                  child: ClipOval(
                      child: buildCacheNetworkImage(width: profilePictureSize, height: profilePictureSize, url: GLOBAL_URL+'/user/avatar.png')
                  ),
                ),
              ),
              // create edit icon in the picture
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(top: 0, left: MediaQuery.of(context).size.width/4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 1,
                  child: Icon(Icons.edit, size: 12, color: CHARCOAL),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verifiedLabel(){
    return Container(
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
          color: SOFT_BLUE,
          borderRadius: BorderRadius.circular(2)
      ),
      child: Row(
        children: [
          Text(AppLocalizations.of(context)!.translate('verified')!, style: TextStyle(
              color: Colors.white, fontSize: 11
          )),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.done, color: Colors.white, size: 11)
        ],
      ),
    );
  }

  void _showPopupUpdatePicture() {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(AppLocalizations.of(context)!.translate('no')!, style: TextStyle(color: SOFT_BLUE))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePicturePage()));
        },
        child: Text(AppLocalizations.of(context)!.translate('yes')!, style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(AppLocalizations.of(context)!.translate('edit_profile_picture')!, style: TextStyle(fontSize: 18),),
      content: Text(AppLocalizations.of(context)!.translate('edit_profile_picture_message')!, style: TextStyle(fontSize: 13, color: BLACK_GREY)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
