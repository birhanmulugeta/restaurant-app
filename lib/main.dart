import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:restaurant_app/home.dart';
import 'package:restaurant_app/cart.dart';
import 'package:restaurant_app/menu.dart';
import 'package:restaurant_app/reserve.dart';
import 'package:restaurant_app/routing/router.dart';
import 'package:restaurant_app/routing/routingConstants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.removeAfter(initialization);

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: generateRoute,
      initialRoute: HomePageRoute,
      title: 'restaurant app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // home: const Reserve(),
    );
  }
}
