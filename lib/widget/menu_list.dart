import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/menu_item_widget.dart';
class menu_list extends StatelessWidget {
  const menu_list({Key? key ,required this.item}) : super(key: key);
    final String item;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          children: [
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
        ),
      ),


    );
  }
}
