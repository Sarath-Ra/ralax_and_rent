import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ralax_and_rent/forms/rent_form.dart';
import 'package:ralax_and_rent/read%20data/get_user_name.dart';
import 'package:ralax_and_rent/widget/radio_button.dart';

import '../forms/sale_form.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  // final _phoneNoController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;
  List<String> docIDs = []; // document IDs

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
              // print(document.reference.get());
            }));
  }

  final CollectionReference _userdetails =
      FirebaseFirestore.instance.collection('users');

  bool _showRentForm = false;
  bool _isPropertySale = false;

  bool _editEnable = true;

  void changeEditEnable() {
    setState(() {
      _editEnable = !_editEnable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SafeArea(
            child: Center(
                child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            
            Center(
              child: Text(
                "Hello There!",
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
              ),
            ),
            
            // first name text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    readOnly: _editEnable,
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Firstname'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    readOnly: _editEnable,
                    controller: _lastNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Lastname'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.grey[200],
            //       border: Border.all(color: Colors.white),
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 20.0),
            //       child: TextField(
            //         keyboardType: TextInputType.phone,
            //         controller: _phoneNoController,
            //         decoration: InputDecoration(
            //             border: InputBorder.none, hintText: 'Phone no.'),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    readOnly: _editEnable,
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: user.email!),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
          ],
        ))),
        Container(
          width: MediaQuery.of(context).size.width * 0.37,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("EDIT PROFILE"),
              IconButton(
                onPressed: () => changeEditEnable(),
                icon: Icon(
                  Icons.edit,
                  size: 20,
                ))
            ],
          ),
        ),
        MaterialButton(
          onPressed: () => changeEditEnable(),
          color: Theme.of(context).accentColor,
          child: Text("Save Details"),
        ),

        // Expanded(
        //     child: FutureBuilder(
        //   future: getDocId(),
        //   builder: (context, snapshot) {
        //     return ListView.builder(
        //         itemCount: docIDs.length,
        //         itemBuilder: (context, index) {
        //           return ListTile(
        //             title: GetUserName(documentId: docIDs[index]),
        //           );
        //         });
        //   },
        // )),
        // Expanded(
        //     child: FutureBuilder(
        //   future: getDocId(),
        //   builder: (context, snapshot) {
        //     return ListView.builder(
        //         itemCount: docIDs.length,
        //         itemBuilder: (context, index) {
        //           return ListTile(
        //             title: GetUserName(documentId: docIDs[index]),
        //           );
        //         });
        //   },
        // )),
        SizedBox(
          height: 10,
        ),
        // Container(
        //   decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(30)),
        //   width: MediaQuery.of(context).size.width * 0.77,
        //   // margin: ,
        //   // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        //   //color: Colors.amberAccent,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "RENT/SELL YOUR PROPERTY?",
        //         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //       ),
        //       Switch(
        //         value: _isPropertySale,
        //         onChanged: (bool val) {
        //           setState(() {
        //             _isPropertySale = val;
        //           });
        //         }
        //       ),
        //     ],
        //   ),
        // ),


        SizedBox(
          height: 10,
        ),
        
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return SaleForm();
            }));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(30)),
            width: MediaQuery.of(context).size.width * 0.78,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SALE-PROPERTY",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 30, weight: 30,)
              ],
            ),
          ),
        ),

        SizedBox(
          height: 10,
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return  RentForm();
            }));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(30)),
            width: MediaQuery.of(context).size.width * 0.78,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "RENT-PROPERTY",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 30, weight: 30,)
              ],
            ),
          ),
        ),

        SizedBox(
          height: 10,
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(30)),
          width: MediaQuery.of(context).size.width * 0.78,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "FAVOURITES",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 30, weight: 30,)
            ],
          ),
        ),

        SizedBox(
          height: 10,
        ),

        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(30)),
          width: MediaQuery.of(context).size.width * 0.78,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "MY PROPERTIES",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 30, weight: 30,)
            ],
          ),
        ),

        // if (_isPropertySale) Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   // crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text(
        //       "Rent",
        //       style: TextStyle(fontSize: 15),
        //     ),
        //     Switch(
        //         value: _showRentForm,
        //         onChanged: (bool val) {
        //           setState(() {
        //             _showRentForm = val;
        //           });
        //         }),
        //     Text(
        //       "Sale",
        //       style: TextStyle(fontSize: 15),
        //     ),
        //   ],
        // ),
        // if (_isPropertySale) if (!_showRentForm) 
        //   RentForm(),
        // if (_isPropertySale) if (_showRentForm)
        //   SaleForm(),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          elevation: 5,
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          color: Theme.of(context).accentColor,
          child: Text("SIGNOUT",),
          //child: Text("SIGN OUT " + user.email!),
        ),
      ]),
    ));
  }
}
