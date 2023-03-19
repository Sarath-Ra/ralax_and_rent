import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ralax_and_rent/pages/feed_page.dart';
import 'package:ralax_and_rent/pages/profile_page.dart';
import 'package:ralax_and_rent/pages/rent_page.dart';
import 'package:ralax_and_rent/pages/sale_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  final List<String> titleName = ['Home', 'Rent', 'Sale', 'Profile'];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    if (_selectedPageIndex == index) {
      return;
    }
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget get bottomNavigationBar {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.amber,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.house),
              label: 'Rent'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.real_estate_agent),
              label: 'Sale'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.person),
              label: 'Profile')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedPageIndex == 0
          ? FeedPage()
          : _selectedPageIndex == 1
              ? RentPage()
              : _selectedPageIndex == 2
                  ? SalePage()
                  : ProfilePage(),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
