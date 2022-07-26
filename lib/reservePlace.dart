import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/menu/customDrawer.dart';
import 'package:restaurant_app/widget/Reserve.dart';

class ReservePlace extends StatefulWidget {
  const ReservePlace({Key? key}) : super(key: key);

  @override
  State<ReservePlace> createState() => _ReservePlaceState();
}

class _ReservePlaceState extends State<ReservePlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text("Reserve Place"),
      ),
      body: Reserve(thumbnailUrl: 'https://i.ibb.co/JtWWbrx/OIP.jpg'),
    );
  }
}
