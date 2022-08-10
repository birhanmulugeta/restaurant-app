import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {

  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Row(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(color:  Colors.amber,
                borderRadius: BorderRadius.circular((12))),
          child: const CircleAvatar(
            backgroundImage: NetworkImage('https://www.bing.com/th?id=AAyj3fZFPQozAHw480x360&w=200&h=200&c=7&rs=1&qlt=80&o=6&cdv=1&dpr=1.25&pid=Local'),
            radius: 25,
          ),
          ),
        ),
      ],),
    );
  }
}
