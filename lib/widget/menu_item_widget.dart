import 'package:flutter/material.dart';
import 'package:restaurant_app/cart.dart';
import 'package:restaurant_app/reservePlace.dart';

import '../routing/routingConstants.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String type;
  final String status;
  final String? thumbnailUrl;

  final Product? product;

  RecipeCard({
    required this.title,
    required this.price,
    required this.type,
    required this.description,
    required this.status,

    required this.thumbnailUrl,
    this.product

  
  });

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
              height: 180,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
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
                  image: NetworkImage("https://i.ibb.co/w011b16/food1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.17,
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 200),
                        decoration: BoxDecoration(
                            color: Colors.amberAccent.withOpacity(1),
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          children: [
                            Text(price+" "+'br',style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.fastfood,
                                color: Colors.blue,
                                size: 18,
                              ),
                              const SizedBox(width: 7),
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.33,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
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
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(description,
                        maxLines: 3,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ReservePlace(product: product,)),
                            );

                            // Navigator.pushNamed(context, ReserveRoute);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.food_bank,
                                color: Colors.black,
                                size: MediaQuery.of(context).size.width * 0.04,
                              ),
                              const Text("Order",
                                  style: TextStyle(color: Colors.black)),
                              // const ReadMoreText(
                              //   'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                              //   trimLines: 2,
                              //   colorClickableText: Colors.pink,
                              //   trimMode: TrimMode.Line,
                              //   trimCollapsedText: '...Show more',
                              //   trimExpandedText: ' show less',
                              // ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          onPressed: null,
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                                size: MediaQuery.of(context).size.width * 0.04,
                              ),
                              const Text(" To cart",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          onPressed: null,
                          child: Row(
                            children: [
                              Icon(
                                Icons.delivery_dining,
                                color: Colors.black,
                                size: MediaQuery.of(context).size.width * 0.04,
                              ),
                              const Text("Deliver",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
