import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ralax_and_rent/read%20data/get_user_name.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> docIDs = []; // document IDs

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.amber,
            child: Text("sign out " + user.email!),
          ),
          Expanded(child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetUserName(documentId: docIDs[index]),
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
