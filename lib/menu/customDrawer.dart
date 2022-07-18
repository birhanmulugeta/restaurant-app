import 'package:flutter/material.dart';
import 'package:restaurant_app/routing/routingConstants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Drawer(
        width: screenWidth * 0.8,
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.28,
              width: screenWidth * 0.8,
              // color: Colors.amber,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/food1.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.01),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFFFA726),
                            radius: screenWidth * 0.17,
                            child: CircleAvatar(
                              backgroundImage:
                                  const AssetImage("assets/food2.jpg"),
                              radius: screenWidth * 0.16,
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.035, top: screenWidth * 0.01),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("[USERNAME]",
                          style: TextStyle(
                              color: const Color(0xFFFFA726),
                              fontSize: screenWidth * 0.043,
                              fontWeight: FontWeight.w600)),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.035, top: screenWidth * 0.0001),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("[email]",
                          style: TextStyle(
                              color: const Color(0xFFFFA726),
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w400)),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  color: Color(0xFFB71C1C),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.012),
                        child: ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Color(0xFFFFA726),
                            size: screenWidth * 0.1,
                          ),
                          title: Text(' Home ',
                              style: TextStyle(
                                  color: const Color(0xFFFFA726),
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w400)),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, HomePageRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.012),
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_cart,
                            color: Color(0xFFFFA726),
                            size: screenWidth * 0.1,
                          ),
                          title: Text(' Cart ',
                              style: TextStyle(
                                  color: Color(0xFFFFA726),
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w400)),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, CartRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.012),
                        child: ListTile(
                          leading: Icon(
                            Icons.list,
                            color: Color(0xFFFFA726),
                            size: screenWidth * 0.1,
                          ),
                          title: Text(' Orderd List ',
                              style: TextStyle(
                                  color: Color(0xFFFFA726),
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w400)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.012),
                        child: ListTile(
                          leading: Icon(
                            Icons.location_city,
                            color: Color(0xFFFFA726),
                            size: screenWidth * 0.1,
                          ),
                          title: Text(' Reserve ',
                              style: TextStyle(
                                  color: Color(0xFFFFA726),
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w400)),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, ReserveRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.012),
                        child: ListTile(
                          leading: Icon(
                            Icons.edit,
                            color: Color(0xFFFFA726),
                            size: screenWidth * 0.1,
                          ),
                          title: Text(' Edit Profile ',
                              style: TextStyle(
                                  color: Color(0xFFFFA726),
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w400)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.012),
                        child: ListTile(
                          leading: Icon(
                            Icons.restaurant,
                            color: Color(0xFFFFA726),
                            size: screenWidth * 0.1,
                          ),
                          title: Text(' About Restaurant ',
                              style: TextStyle(
                                  color: Color(0xFFFFA726),
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w400)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.012),
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Color(0xFFFFA726),
                            size: screenWidth * 0.1,
                          ),
                          title: Text('LogOut',
                              style: TextStyle(
                                  // color: Color(0xFF616161),
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w400)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
