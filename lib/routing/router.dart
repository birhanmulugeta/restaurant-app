import 'package:flutter/material.dart';
import 'package:restaurant_app/routing/routingConstants.dart';
import 'package:restaurant_app/home.dart';
import 'package:restaurant_app/cart.dart';
import 'package:restaurant_app/menu.dart';
import 'package:restaurant_app/reserve.dart';

import 'package:restaurant_app/main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case CartRoute:
      return MaterialPageRoute(builder: (context) => const Cart());
    case MenuRoute:
      return MaterialPageRoute(builder: (context) => const Menu());
    case ReserveRoute:
      return MaterialPageRoute(builder: (context) => const Reserve());
    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
