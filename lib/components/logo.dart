import 'package:chat_app/constants/all_constants.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.width, this.height, this.radius})
      : super(key: key);

  final width;
  final height;
  final radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          shape: BoxShape.rectangle,
          color: Colors.white.withOpacity(0.5)),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: Image(
          image: AssetImage(ImageConstant.whatsappLogo),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
