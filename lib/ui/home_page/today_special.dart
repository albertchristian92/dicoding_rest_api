import 'package:dicoding_rest_api/ui/widgets/special_card.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_rest_api/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_rest_api/ui/widgets/error_information.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dicoding_rest_api/common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:dicoding_rest_api/ui/widgets/popular_card.dart';

class TodaySpecial extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.HasData)
      {
        // var dataRestaurant = state.result.restaurants[index];
        StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: const [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Tile(index: 1),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Tile(index: 1),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Tile(index: 2),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Tile(index: 3),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: Tile(index: 4),
              ),
            ],
        );
      } else if (state.state == ResultState.NoData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.Error) {
        return Center(child: Text(state.message));
        // return ErrorInformation();
      } else
        {
        return Text('');
      }
      return ErrorInformation();
    });
  }
}