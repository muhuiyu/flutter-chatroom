import 'package:chat_app/components/logo.dart';
import 'package:chat_app/constants/all_constants.dart';
import 'package:chat_app/screens/all_screens.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';

class EditNumber extends StatefulWidget {
  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  // const EditNumber({Key? key}) : super(key: key);
  var _enterPhoneNumber = TextEditingController();

  Map<String, dynamic> data = {
    DataConstant.name: 'Portugal',
    DataConstant.dialCode: '+351'
  };

  Map<String, dynamic>? dataResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(TextConstant.editNumberTitle),
        previousPageTitle: TextConstant.back,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Logo(
                width: 80.0,
                height: 80.0,
                radius: 30.0,
              ),
              Text(
                'Verification - one step',
                style: TextStyleConstant.greenH2,
              )
            ],
          ),
          Text(
            TextConstant.enterYourPhoneNumber,
            style: TextStyleConstant.greyH2,
          ),
          CupertinoListTile(
            onTap: () async {
              dataResult = await Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => SelectCountry()));
              setState(() {
                if (dataResult != null) {
                  data = dataResult!;
                }
              });
            },
            title: Text(
              data[DataConstant.name],
              style: TextStyleConstant.greenBody,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Text(data[DataConstant.dialCode],
                  style: TextStyleConstant.greyBody),
              Expanded(
                child: CupertinoTextField(
                  placeholder: TextConstant.enterYourPhoneNumber,
                  controller: _enterPhoneNumber,
                  keyboardType: TextInputType.number,
                  style: TextStyleConstant.secondaryLabelBody,
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: CupertinoButton.filled(
                child: Text(TextConstant.requestCode),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => VerifyNumber(
                          number: data[DataConstant.dialCode]! +
                              _enterPhoneNumber.text,
                        ),
                      ));
                }),
          )
        ],
      ),
    );
  }
}
