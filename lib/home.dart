import 'package:flutter/material.dart';
//import 'package:restaurant_app/widgets/Catagory_Selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> catagories = [
    "foods",
    "soft drinks",
    "alcohol's ",
    "traditional foods",
    "most selected",
    "foreign foods"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30,
          color: Colors.black,
          onPressed: () {},
        ),
        title: const Text(
          "restaurant app",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          InkWell(
            child:CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: const Text('AH'),
            ),
      ),
        ],
      ),
      body: Column(
          children: <Widget>[
            Container(
              height: 90.0,
              color: Colors.amberAccent,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catagories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    child: Text(
                      catagories[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  );
                },
              ),
            ),
          ]
      ),

        bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        height: 75,
        width: double.infinity,
        // double.infinity means it cove the available width
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -7),
              blurRadius: 33,
              color: const Color(0xFF6DAED9).withOpacity(0.11),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.food_bank_sharp),
              onPressed: () {},
            ),
      ]
    ),
    ),
    );
  }
  }

