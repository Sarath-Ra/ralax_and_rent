import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ralax_and_rent/new_page/rent_details.dart';

class HouseItemRent extends StatelessWidget {
  String area;
  String date;
  String furnished;
  String imageUrl;
  String owner;
  int phone;
  int price;
  int type;
  String loc;

  HouseItemRent(
      {required this.area,
      required this.date,
      required this.furnished,
      required this.imageUrl,
      required this.loc,
      required this.owner,
      required this.phone,
      required this.price,
      required this.type});

  // void fetchRentHomeDetails() async {
  //   CollectionReference _reference =
  //       FirebaseFirestore.instance.collection('rent_house_details');
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RentDetails(area: area, date: date, furnished: furnished, imageUrl: imageUrl, loc: loc, owner: owner, phone: phone, price: price, type: type);
        }));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.currency_rupee_rounded),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: null,
                              icon: Icon(Icons.favorite_border_rounded)),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Like",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.home,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            type.toString() + "BHK",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            area + " Sq.Ft.",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          // Icon(Icons.event_seat, size: 20,),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            furnished,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}












// class MealItem extends StatelessWidget {
//   final String id;
//   final String title;
//   final String imageUrl;
//   final int duration;
//   final Complexity complexity;
//   final Affordability affordability;

//   MealItem(
//       {required this.id,
//       required this.title,
//       required this.imageUrl,
//       required this.duration,
//       required this.complexity,
//       required this.affordability});

//   void selectMeal(BuildContext context) {
//     Navigator.of(context).pushNamed(
//       MealDetailScreen.routeName,
//       arguments: id
//     );
//   }

//   String get complexityText {
//     if (complexity == Complexity.Simple) return 'Simple';
//     if (complexity == Complexity.Challenging) return 'Challenging';
//     if (complexity == Complexity.Hard) return 'Hard';
//     return "Easy to Do";
//   }

//   String get affordabilityText {
//     if (affordability == Affordability.Affordable) return 'Affordable';
//     if (affordability == Affordability.Pricey) return 'Pricey';
//     if (affordability == Affordability.Luxurious) return 'Luxurious';
//     return "Easy to Do";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => selectMeal(context),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 4,
//         margin: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15)),
//                   child: Image.network(
//                     imageUrl,
//                     height: 250,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                     bottom: 20,
//                     right: 10,
//                     child: Container(
//                         width: 250,
//                         color: Colors.black54,
//                         padding:
//                             EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                         child: Text(
//                           title,
//                           style: TextStyle(fontSize: 26, color: Colors.white),
//                           softWrap: true,
//                           overflow: TextOverflow.fade,
//                         )))
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(Icons.schedule),
//                       SizedBox(
//                         width: 6,
//                       ),
//                       Text('$duration mins'),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.work),
//                       SizedBox(
//                         width: 6,
//                       ),
//                       Text(complexityText),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.attach_money),
//                       SizedBox(
//                         width: 6,
//                       ),
//                       Text(affordabilityText),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
