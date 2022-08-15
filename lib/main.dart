import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'package:restaurant_app/home.dart';
import 'package:restaurant_app/cart.dart';
import 'package:restaurant_app/menu.dart';
import 'package:restaurant_app/routing/router.dart';
import 'package:restaurant_app/routing/routingConstants.dart';
import 'package:restaurant_app/widget/checkBox.dart';
import 'widget/menu_item_widget.dart';
import 'widget/Reserve.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: const [



          // CheckBox(),
        ],
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
