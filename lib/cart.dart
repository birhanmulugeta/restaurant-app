import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/widget/Reserve.dart';
import 'package:restaurant_app/widget/menu_item_widget.dart';

import 'menu/customDrawer.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text("cart"),

      ),
        body:ListView(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            RecipeCard(
              title: 'Pizza',
              price: '130 br',
              type: '30 min',
              status: 'Exist',
              description:
              'Food for date, to chill with friends and if you have a small birthday.Food for date, to chill with friends and if you have a small birthday.',
              thumbnailUrl: 'https://i.ibb.co/w011b16/food1.jpg',
            ),
            RecipeCard(
              title: 'Pizza',
              price: '130 br',
              type: '30 min',
              status: 'Exist',
              description:
              'Food for date, to chill with friends and if you have a small birthday.Food for date, to chill with friends and if you have a small birthday.',
              thumbnailUrl: 'https://i.ibb.co/w011b16/food1.jpg',
            ),
            RecipeCard(
              title: 'Pizza',
              price: '130 br',
              type: '30 min',
              status: 'Exist',
              description:
              'Food for date, to chill with friends and if you have a small birthday.Food for date, to chill with friends and if you have a small birthday.',
              thumbnailUrl: 'https://i.ibb.co/w011b16/food1.jpg',
            ),
          ],
        )
    );
  }
}
