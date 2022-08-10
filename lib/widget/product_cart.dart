import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  final String title;
  final String price;
  final String description;
  final String type;
  final String status;
  final List<String>? thumbnailUrl;

  Product({
    required this.title,
    required this.price,
    required this.type,
    required this.description,
    required this.status,
    this.thumbnailUrl,
});
  // static List<Product> products=[
  //   Product(
  //   title: 'enjera',
  //   price: '130 br',
  //   type: '30 min',
  //   status: 'Exist',
  //   description:
  //   'Food for date, to chill with friends and if you have a small birthday.Food for date, to chill with friends and if you have a small birthday.',
  //   thumbnailUrl: 'https://i.ibb.co/w011b16/food1.jpg',
  //   ),
  //   Product(
  //   title: 'Pizza',
  //   price: '130 br',
  //   type: '30 min',
  //   status: 'Exist',
  //   description:
  //   'Food for date, to chill with friends and if you have a small birthday.Food for date, to chill with friends and if you have a small birthday.',
  //   thumbnailUrl: 'https://i.ibb.co/w011b16/food1.jpg',
  //   ),
  //   Product(
  //   title: 'Pizza',
  //   price: '130 br',
  //   type: '30 min',
  //   status: 'Exist',
  //   description:
  //   'Food for date, to chill with friends and if you have a small birthday.Food for date, to chill with friends and if you have a small birthday.',
  //   thumbnailUrl: 'https://i.ibb.co/w011b16/food1.jpg',
  //   ),
  //   Product(
  //   title: 'Pizza',
  //   price: '130 br',
  //   type: '30 min',
  //   status: 'Exist',
  //   description:
  //   'Food for date, to chill with friends and if you have a small birthday.Food for date, to chill with friends and if you have a small birthday.',
  //   thumbnailUrl: 'https://i.ibb.co/w011b16/food1.jpg',
  //   ),
  //   Product(
  //     title: 'kocho',
  //     price: '200 br',
  //     type: '29 min',
  //     status: 'Exist',
  //     description:
  //     'Ethiopia, to chill with friends and if you have a small birthday.Food for date, to chill with friends and if you have a small birthday.',
  //     thumbnailUrl: 'https://i.ibb.co/w011b16/food1.jpg',
  //   ),
  // ];


  factory Product.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Product(
      title: data?['title'],
      price: data?['price'],
      type: data?['type'],
      status: data?['status'],
      description: data?['description'],
      thumbnailUrl:
      data?['thumbnailUrl'] is Iterable ? List.from(data?['thumbnailUrl']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) "name": title,
      if (price != null) "state": price,
      if (type != null) "country": type,
      if (status != null) "capital": status,
      if (description != null) "population": description,
      if (thumbnailUrl != null) "regions": thumbnailUrl,
    };
  }

}
