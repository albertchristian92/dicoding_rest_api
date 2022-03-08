import 'package:flutter/material.dart';
import 'package:dicoding_rest_api/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_rest_api/widgets/error_information.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 1),
  StaggeredTile.count(2, 1),
  // StaggeredTile.count(1, 1),
  // StaggeredTile.count(2, 2),
  // StaggeredTile.count(1, 2),
  // StaggeredTile.count(1, 1),
  // StaggeredTile.count(3, 1),
  // StaggeredTile.count(1, 1),
  // StaggeredTile.count(4, 1),
];

const List<Widget> _tiles = <Widget>[
  _Example09Tile(Colors.green, Icons.widgets),
  _Example09Tile(Colors.lightBlue, Icons.wifi),
  _Example09Tile(Colors.amber, Icons.panorama_wide_angle),
  // _Example09Tile(Colors.brown, Icons.map),
  // _Example09Tile(Colors.deepOrange, Icons.send),
  // _Example09Tile(Colors.indigo, Icons.airline_seat_flat),
  // _Example09Tile(Colors.red, Icons.bluetooth),
  // _Example09Tile(Colors.pink, Icons.battery_alert),
  // _Example09Tile(Colors.purple, Icons.desktop_windows),
  // _Example09Tile(Colors.blue, Icons.radio),
];

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