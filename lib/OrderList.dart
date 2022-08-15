import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/widget/OrderListWidget.dart';
import 'package:restaurant_app/widget/Reserve.dart';
import 'package:restaurant_app/widget/menu_item_widget.dart';

import 'menu/customDrawer.dart';

class OrderList extends StatefulWidget {
  OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList>createState() => _OrderListState();
}

Widget _buildList(QuerySnapshot snapshot) {
  return ListView.builder(
    itemCount: snapshot.docs.length,
    itemBuilder: (context, index) {
      final doc = snapshot.docs[index];
      final map = doc.data();
      return const ListTile(// title: Text(map("title")),
      );
    },
  );
}

class _OrderListState extends State<OrderList> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Product> productList = [];

  Future<List<Product>> getDataOnce_customObjects() async {
    productList.clear();
    final collectionReference =
    _db.collection("birhan").doc("menu").collection('foods').withConverter(
      fromFirestore: Product.fromFirestore,
      toFirestore: (Product products, _) => products.toFirestore(),
    );
    final docSnap1 = await collectionReference.get();
    final products = docSnap1.docs;

    products.forEach((element) {
      this.productList.add(element.data());
      print(productList);
    });

    return productList;
  }

  @override
  void initState() {
    // getDataOnce_customObjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text("Order List"),
        ),
        body: SafeArea(
          child: FutureBuilder(
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Orderlist(
                          title: productList[index].menu_name,
                          price: productList[index].price,
                          thumbnailUrl: "https://i.ibb.co/w011b16/food1.jpg");
                    });
              },
              future: getDataOnce_customObjects()),
        ));
  }
}

class Product {
  final String menu_name;
  final String price;
  final String description;

  Product({
    required this.menu_name,
    required this.price,
    required this.description,

  });
  factory Product.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Product(
      menu_name: data?['menu_name'],
      price: data?['price'],
      description: data?['description'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (menu_name != null) "name": menu_name,
      if (price != null) "state": price,
      if (description != null) "population": description,

    };
  }
}
