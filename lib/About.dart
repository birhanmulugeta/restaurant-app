import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/menu/customDrawer.dart';
import 'package:restaurant_app/widget/AboutRestaurant.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text("About us"),
      ),
      body: SafeArea(
          child: Column(
        children: const [
          About(thumbnailUrl: 'https://i.ibb.co/JtWWbrx/OIP.jpg'),
        ],
      )),
    );
  }
}

