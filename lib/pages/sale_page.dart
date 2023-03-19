import 'package:flutter/material.dart';
import 'package:ralax_and_rent/widget/house_item_sale.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return HouseItemSale();
          },
          itemCount: 4,
        ));
  }
}