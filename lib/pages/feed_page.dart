import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget/house_item_rent.dart';
import 'package:intl/intl.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key}) {
    _stream = _reference.snapshots();
  }

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('rent_house_details');

  late Stream<QuerySnapshot> _stream;

  DateTime recentDates = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Some Error Occured ${snapshot.error}"),
          );
        }
        if (snapshot.hasData) {
          QuerySnapshot querySnapshot = snapshot.data;
          List<QueryDocumentSnapshot> document = querySnapshot.docs;

          List<Map> items = document
              .map((e) => {
                    'id': e.id,
                    'area': e['area'],
                    'date': e['date'],
                    'furnished': e['furnished'],
                    'imageUrlHome': e['imageUrlHome'],
                    'loc': e['loc'],
                    'owner_name': e['owner_name'],
                    'phone': e['phone'],
                    'price': e['price'],
                    'type': e['type'],
                  })
              .toList();
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Map thisItem = items[index];
              DateTime d = DateTime.parse(thisItem['date']);
              if (d.isAfter(DateTime.now().subtract(Duration(days: 7))))
                return HouseItemRent(
                    area: thisItem['area'],
                    date: thisItem['date'],
                    furnished: thisItem['furnished'],
                    imageUrl: thisItem['imageUrlHome'],
                    loc: thisItem['loc'],
                    owner: thisItem['owner_name'],
                    phone: thisItem['phone'],
                    price: thisItem['price'],
                    type: thisItem['type']);
            },
            itemCount: items.length,
          );
        }
        print(recentDates);

        return Center(child: CircularProgressIndicator());
      },
    )

        // ListView.builder(
        //   itemBuilder: (ctx, index) {
        //     return HouseItemRent();
        //   },
        //   itemCount: 4,
        // )
        );
  }
}
