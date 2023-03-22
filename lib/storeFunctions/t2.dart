// fetch the list of user details


// List<String> docIDs = []; // document IDs

//   Future getDocId() async {
//     await FirebaseFirestore.instance
//         .collection('users')
//         .get()
//         .then((snapshot) => snapshot.docs.forEach((document) {
//               print(document.reference);
//               docIDs.add(document.reference.id);
//             }));
//   }

//   final CollectionReference _userdetails =
//       FirebaseFirestore.instance.collection('users');




// Expanded(child: FutureBuilder(
//             future: getDocId(),
//             builder: (context, snapshot) {
//               return ListView.builder(
//                   itemCount: docIDs.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: GetUserName(documentId: docIDs[index]),
//                     );
//                   });
//             },
//           ))