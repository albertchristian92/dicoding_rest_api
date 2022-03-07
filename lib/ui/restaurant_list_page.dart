// import 'package:dicoding_rest_api/provider/restaurant_provider.dart';
// import 'package:dicoding_rest_api/widgets/card_restaurant.dart';
// import 'package:dicoding_rest_api/widgets/platform_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class RestaurantListPage extends StatelessWidget {
//   Widget _buildList() {
//     return Consumer<RestaurantProvider>(
//       builder: (context, state, _) {
//         if (state.state == ResultState.Loading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (state.state == ResultState.HasData) {
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: state.result.restaurants.length,
//             itemBuilder: (context, index) {
//               var restaurant = state.result.restaurants[index];
//               return CardRestaurant(restaurant: restaurant);
//             },
//           );
//         } else if (state.state == ResultState.NoData) {
//           return Center(child: Text(state.message));
//         } else if (state.state == ResultState.Error) {
//           return Center(child: Text(state.message));
//         } else {
//           return Center(child: Text(''));
//         }
//       },
//     );
//   }
//
//   Widget _buildAndroid(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Restaurant App'),
//       ),
//       body: _buildList(),
//     );
//   }
//
//   Widget _buildIos(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Restaurant App'),
//         transitionBetweenRoutes: false,
//       ),
//       child: _buildList(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PlatformWidget(
//       androidBuilder: _buildAndroid,
//       iosBuilder: _buildIos,
//     );
//   }
// }
