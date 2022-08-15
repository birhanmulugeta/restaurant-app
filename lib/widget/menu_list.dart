import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/menu_item_widget.dart';
import 'package:restaurant_app/widget/product_cart.dart';
class menu_list extends StatelessWidget {
  final int index;
  const menu_list({Key? key, required this.index ,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
          return Card();
            // return RecipeCard(
            //     title: Product.products[index].title,
            //     price: Product.products[index].price,
            //     type: Product.products[index].type,
            //     description: Product.products[index].description,
            //     status: Product.products[index].status,
            //     thumbnailUrl: Product.products[index].thumbnailUrl
            // );
          }
      ),


    );
  }
}
