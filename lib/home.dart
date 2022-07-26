import 'package:flutter/material.dart';
import 'package:restaurant_app/menu/customDrawer.dart';
import 'package:restaurant_app/widget/Reserve.dart';
import 'package:restaurant_app/widget/menu_item_widget.dart';
//import 'package:restaurant_app/widgets/Catagory_Selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens =  [
    Center(
      child:RecipeCard(
        title: 'Pizza',
        price: '130 br',
        type: '30 min',
        status: 'Exist',
        description:
        'Food for date, to chill with friends and if you have a small birthday.Food for date, to chill with friends and if you have a small birthday.',
        thumbnailUrl: 'https://i.ibb.co/w011b16/food1.jpg',
      ),

    ),
    const Center(
        child: Text(
      "Menu",
      style: TextStyle(fontSize: 60),
    )),
    const Center(
        child: Text(
      "Cart",
      style: TextStyle(fontSize: 60),
    )),
    const Center(
        child: Text(
      "Reserve",
      style: TextStyle(fontSize: 60),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "Restaurant app",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          InkWell(
            child: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: const Text('AH'),
            ),
          ),
        ],
      ),
      body: Column(children: <Widget>[
        CatagorySelector(
        ),
        screens[currentIndex],
      ]),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        height: 60,
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
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Menu",
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              label: "Reserve",
              backgroundColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}

class CatagorySelector extends StatefulWidget {
  const CatagorySelector({Key? key}) : super(key: key);

  @override
  State<CatagorySelector> createState() => _CatagorySelectorState();
}

class _CatagorySelectorState extends State<CatagorySelector> {
  int selectedIndex = 0;
  final List<String> catagories = [
    "Foods",
    "Soft drinks",
    "Alcohol's ",
    "Traditional foods",
    "Most selected",
    "Foreign foods"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      color: Colors.amberAccent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catagories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Text(
                catagories[index],
                style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.white60,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
