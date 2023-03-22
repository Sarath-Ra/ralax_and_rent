import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RentForm extends StatefulWidget {
  // const RentForm({key? key}) : super(key: key){
  //   _stream = _reference.snapshots();
  // }

  @override
  State<RentForm> createState() => _RentFormState();
}

class _RentFormState extends State<RentForm> {
  final _ownerNameController = TextEditingController();
  final _typeController = TextEditingController();
  final _priceController = TextEditingController();
  final _phoneController = TextEditingController();
  final _furnishedController = TextEditingController();
  final _date = DateFormat.yMd().format(DateTime.now()!);
  final _areaController = TextEditingController();
  final _locationCityController = TextEditingController();

  // final _phoneNoController = TextEditingController();

  String imageUrl = '';

  @override
  void dispose() {
    _ownerNameController.dispose();
    _typeController.dispose();
    _priceController.dispose();
    _phoneController.dispose();
    _furnishedController.dispose();
    _areaController.dispose();
    imageUrl = '';
    _locationCityController.dispose();
    // _phoneNoController.dispose();
    super.dispose();
  }

  Future addPropertyfirebase() async {
    if (_ownerNameController.text.isEmpty ||
        _typeController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _furnishedController.text.isEmpty ||
        _areaController.text.isEmpty ||
        _locationCityController.text.isEmpty) {
      return;
    }

    if (imageUrl.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Atleast upload 1 image"),
            );
          });
      return;
    }

    addPropertyDetails(
        ownerName: _ownerNameController.text.trim(),
        phone: int.parse(_phoneController.text.trim()),
        price: int.parse(_priceController.text.trim()),
        type: int.parse(_typeController.text.trim()),
        area: _areaController.text.trim(),
        date: _date,
        furnished: _furnishedController.text.trim(),
        imageUrl: imageUrl,
        loc: _locationCityController.text.trim());
  }

  Future addPropertyDetails(
      {required String ownerName,
      required int phone,
      required int price,
      required int type,
      required String area,
      required String date,
      required String furnished,
      required String imageUrl,
      required String loc}) async {
    await FirebaseFirestore.instance.collection("rent_house_details").add({
      'area': area,
      'date': date,
      'furnished': furnished,
      'owner_name': ownerName,
      'phone': phone,
      'price': price,
      'type': type,
      'imageUrlHome': imageUrl,
      'loc': loc
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Property - Rent"),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Rent House Details",
              style: TextStyle(fontSize: 20),
            ),
    
            SizedBox(
              height: 30,
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
                    controller: _ownerNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Owner Name'),
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
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: _typeController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'BHK'),
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
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Phone no.'),
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
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Price'),
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
                    keyboardType: TextInputType.text,
                    controller: _furnishedController,
                    //obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Furnished?'),
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
                    controller: _areaController,
                    //obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Area in Sq.Ft.'),
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
            //         controller: _addressController,
            //         decoration: InputDecoration(
            //             border: InputBorder.none, hintText: 'Address'),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
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
                    keyboardType: TextInputType.text,
                    controller: _locationCityController,
                    //obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'City?'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Center(
                  child: MaterialButton(
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  print('${file?.path}');
    
                  if (file == null) return;
    
                  String uniquFileName =
                      DateTime.now().millisecondsSinceEpoch.toString();
    
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirIamges =
                      referenceRoot.child('rent_images');
    
                  Reference referenceImageToUpload =
                      referenceDirIamges.child(uniquFileName);
    
                  try {
                    await referenceImageToUpload.putFile(File(file!.path));
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (error) {}
                },
                color: Colors.grey[500],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('UPLOAD PHOTOS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),), SizedBox(width: 20,),Icon(Icons.photo)],
                ),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: addPropertyfirebase,
                  // dispose();
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    "POST PROPERTY",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






// IconButton(
                    //     onPressed: () async {
                    //       ImagePicker imagePicker = ImagePicker();
                    //       XFile? file = await imagePicker.pickImage(
                    //           source: ImageSource.gallery);
                    //       print('${file?.path}');
                    //     },
                    //     icon: Icon(Icons.photo))