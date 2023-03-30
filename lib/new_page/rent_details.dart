import 'package:flutter/material.dart';

class RentDetails extends StatelessWidget {
  String area;
  String date;
  String furnished;
  String imageUrl;
  String owner;
  int phone;
  int price;
  int type;
  String loc;

  RentDetails(
      {required this.area,
      required this.date,
      required this.furnished,
      required this.imageUrl,
      required this.loc,
      required this.owner,
      required this.phone,
      required this.price,
      required this.type});

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    //final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    // final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "RENT HOUSE",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                          width: 250,
                          color: Colors.black54,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Text(
                            loc,
                            style: TextStyle(fontSize: 26, color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )))
                ],
              ),
              buildSectionTitle('Details', context),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(thickness: 5),
                    Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.price_change),
                        ),
                        title: Text("₹ " + price.toString()),
                        subtitle: Text("PRICE"),
                      ),
                    ),
                    Divider(thickness: 5),
                    Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.location_city),
                        ),
                        title: Text(loc),
                        subtitle: Text("LOCATION"),
                      ),
                    ),
                    Divider(thickness: 5),
                    Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.holiday_village),
                        ),
                        title: Text(type.toString() + "BHK"),
                        // subtitle: Text("PRICE"),
                      ),
                    ),
                    Divider(thickness: 5),
                    Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.square_foot),
                        ),
                        title: Text(area + " Sq.Ft"),
                        subtitle: Text("AREA"),
                      ),
                    ),
                    Divider(thickness: 5),
                    Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.chair),
                        ),
                        title: Text(furnished),
                        subtitle: Text("FURNISHED"),
                      ),
                    ),
                    Divider(thickness: 5),
                    Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(owner),
                        subtitle: Text("OWNER NAME"),
                      ),
                    ),
                    Divider(thickness: 5),
                    Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.contact_phone),
                        ),
                        title: Text(phone.toString()),
                        subtitle: Text("CONTACT NO."),
                      ),
                    ),
                    Divider(thickness: 5),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
