import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_app/constants/all_constants.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chats').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(TextConstant.connectionErrorMessage),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(TextConstant.connecting),
            );
          }
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                const CupertinoSliverNavigationBar(
                  largeTitle: Text(TextConstant.chatsTitle),
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                  if (document.data() != null) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return CupertinoListTile(title: Text(data['title']));
                  } else {
                    return Container();
                  }
                }).toList())),
              ],
            );
          }
          return Container();
        });
  }
}
