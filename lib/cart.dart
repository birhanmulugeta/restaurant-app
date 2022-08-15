import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/widget/Reserve.dart';
import 'package:restaurant_app/widget/menu_item_widget.dart';
import 'package:restaurant_app/widget/product_cart.dart';

import 'menu/customDrawer.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
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

class _CartState extends State<Cart> {
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

    // void getDataOnce_customObjects() async {
    //   // [START get_data_once_custom_objects]
    //   final ref = db.collection("Product").doc("eiDO79axdkg8umMPDcpJ").withConverter(
    //     fromFirestore: Product.fromFirestore,
    //     toFirestore: (Product products, _) => products.toFirestore(),
    //   );
    //   final docSnap = await ref.get();
    //   final products = docSnap.data(); // Convert to City object
    //   if (products != null) {
    //     print(products);
    //   } else {
    //     print("No such document.");
    //   }
    //   // [END get_data_once_custom_objects]
    // }
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text("cart"),
        ),
        body: SafeArea(
          child: FutureBuilder(
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RecipeCard(
                          product: productList[index],
                          title: productList[index].menu_name,
                          price: productList[index].price,
                          type: "productList[index].type",
                          description: productList[index].description,
                          status: "productList[index].item_status",
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

  // final String type;
  // final String item_status;
  // final List<String>? image;

  Product({
    required this.menu_name,
    required this.price,
    // required this.type,
    required this.description,
    // required this.item_status,
    // this.image,
  });

  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Product(
      menu_name: data?['menu_name'],
      price: data?['price'],
      // type: data?['type'],
      // item_status: data?['status'],
      description: data?['description'],
      // image:
      // data?['image'] is Iterable ? List.from(data?['image']) : null,
    );

          child: FutureBuilder(builder: (context, snapshot) {
            return  ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RecipeCard(
                          title: productList[index].title,
                          price: productList[index].price,
                          type: productList[index].type,
                          description: productList[index].description,
                          status: productList[index].status,
                          thumbnailUrl: "https://i.ibb.co/w011b16/food1.jpg"
                      );
                    });
          }, future: getDataOnce_customObjects()),
            // child: ListView.builder(
            //     itemCount: productList.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return RecipeCard(
            //           title: productList[index].title,
            //           price: productList[index].price,
            //           type: productList[index].type,
            //           description: productList[index].description,
            //           status: productList[index].status,
            //           thumbnailUrl: null
            //       );
            //     })
    ));

  }

  Map<String, dynamic> toFirestore() {
    return {
      if (menu_name != null) "name": menu_name,
      if (price != null) "state": price,
      // if (type != null) "country": type,
      // if (item_status != null) "capital":item_status,
      if (description != null) "population": description,
      // if (image != null) "regions": image,
    };
  }
}
