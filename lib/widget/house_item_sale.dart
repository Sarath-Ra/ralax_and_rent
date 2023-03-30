import 'package:flutter/material.dart';
import 'package:ralax_and_rent/new_page/sale_details.dart';

class HouseItemSale extends StatelessWidget {
  int area;
  int con;
  String date;
  String furnished;
  String imageUrl;
  String owner;
  int phone;
  int price;
  String typeVAFI;
  String loc;

  HouseItemSale(
      {required this.area,
      required this.con,
      required this.date,
      required this.furnished,
      required this.imageUrl,
      required this.loc,
      required this.owner,
      required this.phone,
      required this.price,
      required this.typeVAFI});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SaleDetails(area: area, date: date, furnished: furnished, imageUrl: imageUrl, loc: loc, owner: owner, phone: phone, price: price, typeVAFI: typeVAFI, con: con,);
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
                          Text(price.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: null, icon: Icon(Icons.favorite_border_rounded)),
                          SizedBox(
                            width: 6,
                          ),
                          Text("Like", style: TextStyle(fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.home, size: 20,),
                          SizedBox(
                            width: 6,
                          ),
                          Text(typeVAFI, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          // Icon(Icons.home, size: 20,),
                          // SizedBox(
                          //   width: 6,
                          // ),
                          Text(con.toString()  + "BHK", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                        ],
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
                          Text(area.toString() + " Sq.Ft.", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
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
                          Text(furnished, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
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
