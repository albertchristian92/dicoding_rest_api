import 'package:flutter/material.dart';
import 'package:dicoding_rest_api/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_rest_api/widgets/error_information.dart';
import 'package:dicoding_rest_api/widgets/special_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TodaySpecial extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.HasData) {
        const List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
          StaggeredTile.count(2, 2),
          StaggeredTile.count(2, 1),
          StaggeredTile.count(2, 1),
        ];
        const List<Widget> _tiles = <Widget>[
          _Example09Tile(Colors.green, Icons.widgets),
          _Example09Tile(Colors.lightBlue, Icons.wifi),
          _Example09Tile(Colors.amber, Icons.panorama_wide_angle),
        ];
        return StaggeredGridView.count(
          scrollDirection: Axis.horizontal,
          children: _tiles,
          crossAxisCount: 4,
          staggeredTiles: _staggeredTiles,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          );


        // return ListView.builder(
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 3,
        //     itemBuilder: (context, index) {
        //       var dataRestaurant = state.result.restaurants[index];
        //       return SpecialCard(restaurant: dataRestaurant, index: index);
        //     });
      } else if (state.state == ResultState.NoData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.Error) {
        return ErrorInformation();
      } else {
        return Text('');
      }
      return ErrorInformation();
    });
  }
}
class _Example09Tile extends StatelessWidget {
  const _Example09Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}