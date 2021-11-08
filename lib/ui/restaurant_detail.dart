import 'package:dicoding_rest_api/data/model/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/article_detail';

  final Restaurant restaurant;

  const RestaurantDetail({required this.restaurant});

  Widget buildDescription(Widget child) {
    return Container(
      height: 150,
      width: 400,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Image.network('https://restaurant-api.dicoding.dev/images/small/'+restaurant.pictureId),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(color: Colors.grey),
                  Text(
                    'City: ${restaurant.city}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Divider(color: Colors.grey),
                  Text(
                    'Rating: ${restaurant.rating}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Divider(color: Colors.grey),
                  buildDescription(
                      Text(restaurant.description)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
