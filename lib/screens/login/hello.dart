import 'dart:ui';

import 'package:chat_app/components/blur_image_page_scaffold.dart';
import 'package:chat_app/components/lets_start.dart';
import 'package:chat_app/components/logo.dart';
import 'package:chat_app/components/terms_and_conditions.dart';
import 'package:chat_app/screens/all_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants/all_constants.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurImagePageScaffold(
      imagePath: ImageConstant.background,
      body: [
        const Logo(
          width: 150.0,
          height: 150.0,
          radius: 50.0,
        ),
        const Text(
          'Hello',
          style: TextStyleConstant.h1,
        ),
        Column(
          children: const [
            Text(
              'WhatsApp is a Cross-platform',
              style: TextStyleConstant.h3,
            ),
            Text(
              'mobile messageing with friends',
              style: TextStyleConstant.h3,
            ),
            Text(
              'all over the world',
              style: TextStyleConstant.h3,
            )
          ],
        ),
        TermsAndConditions(
          onPressed: () {
            // todo
          },
        ),
        LetsStart(
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => EditNumber()));
          },
        ),
      ],
    );
  }
}
