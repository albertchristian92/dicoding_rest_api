import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dicoding_rest_api/data/model/restaurant.dart';
import 'package:dicoding_rest_api/ui/restaurant_detail_page.dart';
import 'package:dicoding_rest_api/ui/home_page/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends  State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restoran Dicoding ',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        // SearchPage.routeName: (context) => SearchPage(),
        // CategoriesPage.routeName: (context) => CategoriesPage(ModalRoute.of(context)?.settings.arguments as String),
        // RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(ModalRoute.of(context)?.settings.arguments as String,),
      },
    );
  }
}
