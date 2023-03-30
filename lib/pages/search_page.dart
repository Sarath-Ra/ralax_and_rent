// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../new_page/rent_details.dart';

// import 'firebase_options.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).accentColor,
            title: Card(
          child: TextField(
            decoration: InputDecoration(
                //fillColor: Theme.of(context).accentColor,
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        )),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('rent_house_details').snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;

                      if (name.isEmpty) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return RentDetails(area: data['area'], date: data['date'], furnished: data['furnished'], imageUrl: data['imageUrlHome'], loc: data['loc'], owner: data['owner_name'], phone: data['phone'], price: data['price'], type: data['type']);
                            }));
                          },
                          child: ListTile(
                            title: Text(
                              data['loc'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "₹" + data['price'].toString() + "  " + data['type'].toString() + "BHK",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(data['imageUrlHome']),
                            ),
                          ),
                        );
                      }
                      if (data['loc']
                          .toString()
                          .toLowerCase()
                          .startsWith(name.toLowerCase())) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return RentDetails(area: data['area'], date: data['date'], furnished: data['furnished'], imageUrl: data['imageUrlHome'], loc: data['loc'], owner: data['owner_name'], phone: data['phone'], price: data['price'], type: data['type']);
                            }));
                          },
                          child: ListTile(
                            title: Text(
                              data['loc'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "₹" + data['price'].toString() + "  " + data['type'].toString() + "BHK",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(data['imageUrlHome']),
                            ),
                          ),
                        );
                      }
                      return Container();
                    });
          },
        ));
  }
}