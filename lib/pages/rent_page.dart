import 'package:flutter/material.dart';

import '../widget/house_item_rent.dart';

class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return HouseItemRent();
          },
          itemCount: 4,
        ));
  }
}