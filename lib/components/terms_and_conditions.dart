import 'package:chat_app/constants/all_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key, this.onPressed}) : super(key: key);
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
          child: Text(
            TextConstant.termsAndConditions,
            style: TextStyleConstant.h3,
          ),
        ),
      ),
    );
  }
}
