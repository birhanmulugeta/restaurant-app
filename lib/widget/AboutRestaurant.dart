import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../routing/routingConstants.dart';


class About extends StatefulWidget {
  const About({Key? key, required this.thumbnailUrl}) : super(key: key);
  final String thumbnailUrl;

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<Review?> getReview() async {
    final Ref = _db.collection("birhan").doc('Review').withConverter(
          fromFirestore: Review.fromFirestore,
          toFirestore: (Review review, _) => review.toFirestore(),
        );
    try{
      final docSnap = await Ref.get();
      final data = docSnap.data();
      review  = data;
      return data;
    }catch(e){
      print(e.toString());
    }
    throw new Exception();

  }
  Review? review;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
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
                image: NetworkImage(widget.thumbnailUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height* 0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
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
              padding: EdgeInsets.only(top: 30.0, bottom: 30, left: 15),
              child: FutureBuilder(
                future: getReview(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    print(snapshot.data!);
                    dynamic obj = snapshot.data;

                    review = obj;
                  }
                  return Column(
                    children: [
                       Padding(
                         padding: const EdgeInsets.only(bottom: 8.0),
                         child: Text(review!.name.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 25)),
                       ),
                       Text(
                           review!.description,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 15)),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.blueAccent,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                             Text(review!.phone,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.blueAccent,
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.blueAccent,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            Expanded(
                              child:  Text(review!.map,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.blueAccent,
                                      fontSize: 15)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_city,
                              color: Colors.blueAccent,
                              size: MediaQuery.of(context).size.width * 0.06,
                            ),
                            const Text("hayat abvcdsc  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.blueAccent,
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void initState() {
    // getReview();
    super.initState();
  }
}

class Review {
  final String address;
  final String description;
  final String map;
  final String name;
  final String phone;

  Review({
    required this.name,
    required this.address,
    required this.description,
    required this.map,
    required this.phone,
  });

  factory Review.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Review(
      name: data?['name'],
      address: data?['address'],
      description: data?['description'],
      map: data?['map'],
      phone: data?['phone'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (address != null) "address": address,
      if (description != null) "description": description,
      if (map != null) "map": map,
      if (phone != null) "phone": phone,
    };
  }
}
