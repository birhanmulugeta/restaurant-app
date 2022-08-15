import 'package:flutter/material.dart';
import 'package:restaurant_app/Reserve_only_page.dart';
import 'package:restaurant_app/reservePlace.dart';
import 'package:restaurant_app/routing/routingConstants.dart';
import 'package:restaurant_app/home.dart';
import 'package:restaurant_app/cart.dart';
import 'package:restaurant_app/menu.dart';



import 'package:restaurant_app/main.dart';

import '../About.dart';
import '../OrderList.dart';
import '../login.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case CartRoute:
      return MaterialPageRoute(builder: (context) => Cart());
    case MenuRoute:
      return MaterialPageRoute(builder: (context) => const Menu());
    case ReserveRoute:
      return MaterialPageRoute(builder: (context) => const ReservePlace());
    case ReserveOnlyRoute:
      return MaterialPageRoute(builder: (context) => const ReservePlaceOnly());
    case AboutUsRoute:
      return MaterialPageRoute(builder: (context) => const AboutUs());
    case OrderListRoute:
      return MaterialPageRoute(builder: (context) =>  OrderList());
    case LoginRoute:
      return MaterialPageRoute(builder: (context) =>  Login());

    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
