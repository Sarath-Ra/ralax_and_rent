import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SaleForm extends StatefulWidget {
  const SaleForm({super.key});

  @override
  State<SaleForm> createState() => _SaleFormState();
}

class _SaleFormState extends State<SaleForm> {
  String? _dropDownValuetypeVafi = "Villa";
  String? _dropDownValueBHK = '1BHK';
  String? _dropDownisFurnished = "Not Furnished";

  // void dropDownTypeVAFI(String? selectedValue) {
  //   if (selectedValue is String) {
  //     setState(() {
  //       _dropDownValuetypeVafi = selectedValue;
  //     });
  //   }
  // }

  List<String> _typeListVAFI = [
    "Villa",
    "Apartment",
    "Flat",
    "Individual House"
  ];

  List<String> _typeListBHK = ['1BHK', '2BHK', "3BHK"];

  List<String> _typeListFurnished = [
    "Not Furnished",
    "Furnished",
  ];

  final _ownerNameController = TextEditingController();
  // final _typeVAFIController = TextEditingController();
  // DropdownButton(items: typeList, onChanged: dropDownTypeVAFI);
  // final _conController = TextEditingController();
  final _priceController = TextEditingController();
  final _phoneController = TextEditingController();
  // final _furnishedController = TextEditingController();
  final _date = DateFormat.yMd().format(DateTime.now()!);
  final _areaController = TextEditingController();
  final _locController = TextEditingController();

  String imageUrl = '';

  @override
  void dispose() {
    _ownerNameController.dispose();
    // _typeVAFIController.dispose();
    // _conController.dispose();
    _priceController.dispose();
    _phoneController.dispose();
    // _furnishedController.dispose();
    _areaController.dispose();
    imageUrl = '';
    _locController.dispose();
    // _phoneNoController.dispose();
    super.dispose();
  }

  Future addProperty_firebase() async {
    if (_ownerNameController.text.isEmpty ||
        // _typeVAFIController.text.isEmpty ||
        // _conController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        // _furnishedController.text.isEmpty ||
        _areaController.text.isEmpty ||
        _locController.text.isEmpty) {
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
        typeVAFI: _dropDownValuetypeVafi,
        con: int.parse(_dropDownValueBHK![0]),
        area: int.parse(_areaController.text.trim()),
        date: _date,
        furnished: _dropDownisFurnished,
        imageUrl: imageUrl,
        loc: _locController.text.trim());
  }

  Future addPropertyDetails(
      {required String ownerName,
      required int phone,
      required int price,
      required String? typeVAFI,
      required int con,
      required int area,
      required String date,
      required String? furnished,
      required String imageUrl,
      required String loc}) async {
    await FirebaseFirestore.instance.collection("sale_house_details").add({
      'area': area,
      'con': con,
      'date': date,
      'furnished': furnished,
      'imageUrlHome': imageUrl,
      'loc': loc,
      'owner_name': ownerName,
      'phone': phone,
      'price': price,
      'typeVAFI': typeVAFI,
    });

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Center(child: Text("Added Property")),
          );
        });
  }

  // final _phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Property - Sale"),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Sale House Details",
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

            Container(
              padding: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              width: MediaQuery.of(context).size.width * 0.87,
              child: Center(
                child: DropdownButton(
                  isDense: true,
                  alignment: Alignment.centerLeft,
                  isExpanded: true,
                  // disabledHint: Text("VAFI"),
                  iconSize: 40,
                  iconEnabledColor: Theme.of(context).accentColor,
                  value: _dropDownValuetypeVafi,
                  onChanged: (newValue) {
                    setState(() {
                      _dropDownValuetypeVafi = newValue;
                    });
                  },
                  items: _typeListVAFI
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )))
                      .toList(),
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
            //         // keyboardType: TextInputType.numberWithOptions(),
            //         controller: _typeVAFIController,
            //         decoration: InputDecoration(
            //             border: InputBorder.none,
            //             hintText: 'Villa/Apartment/Flat/Individual'),
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
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              width: MediaQuery.of(context).size.width * 0.87,
              child: Center(
                child: DropdownButton(
                  
                  isDense: true,
                  alignment: Alignment.centerLeft,
                  isExpanded: true,
                  // disabledHint: Text("VAFI"),
                  iconSize: 40,
                  iconEnabledColor: Theme.of(context).accentColor,
                  value: _dropDownisFurnished,
                  onChanged: (newValue) {
                    setState(() {
                      _dropDownisFurnished = newValue;
                    });
                  },
                  items: _typeListFurnished
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )))
                      .toList(),
                ),
              ),
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
            //         keyboardType: TextInputType.number,
            //         controller: _conController,
            //         // obscureText: true,
            //         decoration: InputDecoration(
            //             border: InputBorder.none, hintText: 'BHK'),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              width: MediaQuery.of(context).size.width * 0.87,
              child: Center(
                child: DropdownButton(
                  
                  isDense: true,
                  alignment: Alignment.centerLeft,
                  isExpanded: true,
                  // disabledHint: Text("VAFI"),
                  iconSize: 40,
                  iconEnabledColor: Theme.of(context).accentColor,
                  value: _dropDownValueBHK,
                  onChanged: (newValue) {
                    setState(() {
                      _dropDownValueBHK = newValue;
                    });
                  },
                  items: _typeListBHK
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )))
                      .toList(),
                ),
              ),
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
            //         keyboardType: TextInputType.text,
            //         controller: _furnishedController,
            //         // obscureText: true,
            //         decoration: InputDecoration(
            //             border: InputBorder.none, hintText: 'Furnished?'),
            //       ),
            //     ),
            //   ),
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
                    keyboardType: TextInputType.number,
                    controller: _areaController,
                    //0obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Area in Sq.Ft.'),
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
                    controller: _locController,
                    //obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Location'),
                  ),
                ),
              ),
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
                      referenceRoot.child('sale_images');

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
                  children: [
                    Text(
                      'UPLOAD PHOTOS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.photo)
                  ],
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
                onTap: addProperty_firebase,
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
