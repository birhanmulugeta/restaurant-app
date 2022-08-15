import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/cart.dart';
import 'package:restaurant_app/menu/customDrawer.dart';
import 'package:restaurant_app/widget/Reserve.dart' ;
import 'package:restaurant_app/widget/reserve_only.dart';

class ReservePlaceOnly extends StatefulWidget {
  const ReservePlaceOnly({Key? key}) : super(key: key);
  
  @override
  State<ReservePlaceOnly> createState() => _ReservePlaceOnlyState();
}

class _ReservePlaceOnlyState extends State<ReservePlaceOnly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text("Reserve Place"),
      ),
      body:

      ReserveOnly(thumbnailUrl: 'https://i.ibb.co/JtWWbrx/OIP.jpg'),
    );
  }
}
