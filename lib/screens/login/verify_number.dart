import 'package:chat_app/screens/all_screens.dart';
import 'package:chat_app/constants/all_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum Status { waiting, error }

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key, this.number});
  final number;

  @override
  State<VerifyNumber> createState() => _VerifyNumberState(number);
}

class _VerifyNumberState extends State<VerifyNumber> {
  final phoneNumber;
  var _status = Status.waiting;
  var _verificationId;
  var _textEditingController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  _VerifyNumberState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  Future _verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {},
      verificationFailed: (verificationFailed) async {},
      codeSent: (verificationId, forceResendingToken) async {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  Future _sendCodeToFirebase({String? code}) async {
    if (_verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: code!);

      await _auth
          .signInWithCredential(credential)
          .then((value) {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => UserName()));
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            setState(() {
              _textEditingController.text = '';
              _status = Status.error;
            });
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(TextConstant.verifyNumberTitle),
        previousPageTitle: TextConstant.editNumberTitle,
      ),
      child: (_status != Status.error)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    TextConstant.otpVerificationTitle,
                    style: TextStyleConstant.greenH2,
                  ),
                ),
                const Text(
                  TextConstant.otpVerificationEnterMessage,
                  style: TextStyleConstant.secondaryLabelBody,
                ),
                Text(
                  phoneNumber ?? '',
                  style: TextStyleConstant.secondaryLabelBody,
                ),
                CupertinoTextField(
                  onChanged: (value) async {
                    if (value.length == 6) {
                      _sendCodeToFirebase(code: value);
                    }
                  },
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.otpCode,
                  maxLength: 6,
                  controller: _textEditingController,
                  keyboardType: TextInputType.number,
                  autofillHints: const <String>[AutofillHints.oneTimeCode],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      TextConstant.otpVerificationDidntReceiveMessage,
                      style: TextStyleConstant.secondaryLabelBody,
                    ),
                    CupertinoButton(
                      child: const Text(
                        TextConstant.resendCode,
                        style: TextStyleConstant.greenBody,
                      ),
                      onPressed: () async {
                        setState(() {
                          _status = Status.waiting;
                        });
                        _verifyPhoneNumber();
                      },
                    ),
                  ],
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(TextConstant.otpVerificationTitle,
                      style: TextStyleConstant.greenH2),
                ),
                const Text(
                  TextConstant.otpVerificationErrorMessage,
                  style: TextStyleConstant.errorBody,
                ),
                CupertinoButton(
                  child: const Text(
                    TextConstant.editNumberTitle,
                    style: TextStyleConstant.greenBody,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoButton(
                  child: const Text(
                    TextConstant.resendCode,
                    style: TextStyleConstant.greenBody,
                  ),
                  onPressed: () async {
                    setState(() {
                      _status = Status.waiting;
                    });
                    _verifyPhoneNumber();
                  },
                )
              ],
            ),
    );
  }
}
