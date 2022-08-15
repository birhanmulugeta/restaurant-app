import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/routing/routingConstants.dart';
import 'package:restaurant_app/widget/timePicker.dart';
import '../cart.dart';
import 'datePicker.dart';
import 'checkBox.dart';

class Reserve extends StatelessWidget {
  Reserve({Key? key, required this.thumbnailUrl, required this.product})
      : super(key: key);

  final String thumbnailUrl;
  final Product product;
  final controller = TextEditingController();




  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.9),
                    offset: const Offset(
                      0.0,
                      10.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: -6.0,
                  ),
                ],
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.35),
                    BlendMode.color,
                  ),
                  image: NetworkImage(thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    offset: const Offset(
                      0.0,
                      10.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: -6.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Seats',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        const Text('Type',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        const Text('Date',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        const Text('From',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        const Text('To',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, HomePageRoute);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                const Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 130.0,
                          height: 50.0,
                          child: Padding(
                            padding: EdgeInsets.only(left: 65.0, bottom: 5),
                            child: TextField(
                              controller: controller,
                              style: const TextStyle(fontSize: 15, height: 0.5),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              )),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              maxLength: 2,
                            ),
                          ),
                        ),
                        const CheckBox(),
                        const DatePicker(),
                        const TimePicker(),
                        const TimePicker(),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: ElevatedButton(
                            onPressed: () {
                              final seats = controller.text;

                              String menu_item = product.menu_name;
                              String price= product.price;
                              seatNo(seats: seats, menu_item:menu_item ,price:price);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                const Text(
                                  "Reserve",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future seatNo({required String seats, required String menu_item ,required String price}) async {
    final docSeat = FirebaseFirestore.instance
        .collection('birhan')
        .doc('reserve')
        .collection("reserves")
        .doc();

    // final json = {
    //   'seats': seats,
    //   'id': docSeat.id,
    //
    // };

    final reserve = Reserves(
      id: docSeat.id,
      seats: seats,
      menu_item: menu_item ,
      price:price,
    );
    final json = reserve.toJson();
    await docSeat.set(json);
  }
}

class Reserves {
  String id;
  final seats;
  String? menu_item;
  final price;

  Reserves({
    this.id = '',
    required this.seats,
    this.menu_item,
    this.price,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'seats': seats,
        'menu_item':menu_item,
        'price':price,

      };
}
