import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_rest_api/provider/restaurant_provider.dart';
import 'package:dicoding_rest_api/data/api/api_service.dart';
import 'package:dicoding_rest_api/ui/home_page/today_special.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(24, 12, 24, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Semarang, Jawa Tengah, Indonesia',
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Open Sans'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Hello Dicoding',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700)
                        )
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                          width: 50,
                          height: 50,
                          child: const Image(
                            image: AssetImage('assets/avatar.jpg'),
                            fit: BoxFit.cover,
                          )),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24), color: Colors.grey),
                child: Material(
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      Navigator.pushNamed(context, '/search_page');
                      },
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 12,
                        ),
                        Icon(Icons.search),
                        Text(
                          'What would you like to eat?',
                          style: TextStyle(
                              fontFamily: 'Open Sans', fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's Special", style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Find out what's cooking today!", style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                      ),
                      ),
                    ],
                  )
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 20),
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 2 / 6,
                        child: ChangeNotifierProvider<RestaurantProvider>(
                          create: (_) => RestaurantProvider(apiService: ApiService()),
                          child: Row(
                              children: [
                                TodaySpecial(),
                            ]
                          )
                        ),

                      ),
                    ]
                )
              )
            ],
        ),
        )
        ));
  }
}
