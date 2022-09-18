import 'dart:convert';

import 'package:chat_app/constants/all_constants.dart';
import 'package:chat_app/constants/all_constants.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<dynamic>? dataRetrieved; // data decoded from the json file
  List<dynamic>? data; // data to display on the screen
  var _searchController = TextEditingController();
  var searchValue = '';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    final String response =
        await rootBundle.loadString(FileConstant.countryCode);
    dataRetrieved = await json.decode(response) as List<dynamic>;
    setState(() {
      data = dataRetrieved;
    });
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text(TextConstant.selectCountryTitle),
          previousPageTitle: TextConstant.editNumberTitle,
        ),
        SliverToBoxAdapter(
          child: CupertinoSearchTextField(
            onChanged: (value) {
              setState(() {
                searchValue = value;
              });
            },
            controller: _searchController,
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate((data != null)
                ? data!
                    .where((e) => e[DataConstant.name]
                        .toString()
                        .toLowerCase()
                        .contains(searchValue.toLowerCase()))
                    .map((e) => CupertinoListTile(
                          onTap: () {
                            Navigator.pop(context, toJson(e));
                          },
                          title: Text(e[DataConstant.name]),
                          trailing: Text(e[DataConstant.dialCode]),
                        ))
                    .toList()
                : [
                    Center(
                      child: Text(TextConstant.loading),
                    )
                  ]))
      ]),
    );
  }
}

Map<String, dynamic> toJson(Map<String, dynamic> e) {
  return {
    DataConstant.name: e[DataConstant.name],
    DataConstant.dialCode: e[DataConstant.dialCode]
  };
}
