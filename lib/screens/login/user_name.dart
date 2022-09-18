import 'package:chat_app/constants/all_constants.dart';
import 'package:chat_app/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  // const UserName({super.key});
  var _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(TextConstant.enterNameTextFieldTitle),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
            child: CupertinoTextField(
              textAlign: TextAlign.center,
              style: TextStyleConstant.greyBody,
              maxLength: 15,
              controller: _textEditingController,
              keyboardType: TextInputType.name,
            ),
          ),
          CupertinoButton.filled(
              child: const Text(
                TextConstant.continueButton,
                style: TextStyleConstant.whiteBody,
              ),
              onPressed: () {
                FirebaseAuth.instance.currentUser
                    ?.updateDisplayName(_textEditingController.text);

                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => HomePage()));
              }),
        ],
      ),
    );
  }
}
