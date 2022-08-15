import 'package:flutter/material.dart';
import 'package:restaurant_app/cart.dart';
import 'package:restaurant_app/reservePlace.dart';
import 'package:colours/colours.dart';

import '../routing/routingConstants.dart';

class Orderlist extends StatelessWidget {
  final String title;
  final String price;
  final String thumbnailUrl;

  final Product? product;

  Orderlist(
      {required this.title,
      required this.price,
      required this.thumbnailUrl,
      this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                color: Colours.floralWhite,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
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
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.ibb.co/w011b16/food1.jpg'),
                          backgroundColor: Colors.red.shade800,
                          radius: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, bottom: 35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.fastfood,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text(
                                  title.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.timer,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      Text(
                                        'April 24/2015 5:00',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, HomePageRoute);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.06,
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
