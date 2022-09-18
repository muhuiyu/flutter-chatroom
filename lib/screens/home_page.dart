import 'package:chat_app/constants/text_constants.dart';
import 'package:chat_app/screens/all_screens.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var screens = [
    const Chats(),
    const Calls(),
    const People(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              label: TextConstant.chatsTitle,
              icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              label: TextConstant.callsTitle,
              icon: Icon(CupertinoIcons.phone),
            ),
            BottomNavigationBarItem(
              label: TextConstant.peopleTitle,
              icon: Icon(CupertinoIcons.person_alt_circle),
            ),
            BottomNavigationBarItem(
              label: TextConstant.settingssTitle,
              icon: Icon(CupertinoIcons.settings_solid),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return screens[index];
        },
      ),
    );
  }
}
