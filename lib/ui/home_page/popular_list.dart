import 'package:flutter/material.dart';
import 'package:dicoding_rest_api/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_rest_api/ui/widgets/error_information.dart';
import 'package:dicoding_rest_api/ui/widgets/popular_card.dart';

class PopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.HasData) {
        return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              var dataRestaurant = state.result.restaurants[index];
              return PopularCard(restaurant: dataRestaurant, index: index);
            });
      } else if (state.state == ResultState.NoData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.Error) {
        return ErrorInformation();
      } else {
        return Text('');
      }
    });
  }
}
