// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:dicoding_rest_api/data/api/api_service.dart';
// import 'package:dicoding_rest_api/provider/restaurant_detail_provider.dart';
//
// import 'package:dicoding_rest_api/data/model/restaurant_detail.dart';
//
// class RestaurantDetailPage extends StatelessWidget {
//   static const routeName = '/restaurant_detail';
//
//   final String id_restaurant;
//   RestaurantDetailPage(this.id_restaurant);
//
//   @override
//   List<Widget> _listWidget = [
//     ChangeNotifierProvider<RestaurantDetailProvider>(
//       create: (_) => RestaurantDetailProvider(apiService: ApiService(), id: widget.id_restaurant),
//       child: DetailList(),
//     ),
//   ];
//   Widget build(BuildContext context){
//     return Scaffold (
//         body: _listWidget[0]
//     );
//   }
//
// }
// class DetailContent extends StatelessWidget {
//   final Restaurant restaurant;
//
//   const DetailContent({required this.restaurant});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 Image.network("https://restaurant-api.dicoding.dev/images/medium/"+restaurant.pictureId),
//                 SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           child: IconButton(
//                             icon: Icon(
//                               Icons.arrow_back,
//                               color: Colors.white,
//                             ),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 16.0),
//               child: Text(
//                 restaurant.name,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 30.0,
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 16.0),
//               child: Text(
//                 restaurant.description,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 16.0,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 16.0),
//               child: Text(
//                 "Food",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 30.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class DetailList extends StatelessWidget {
//   Widget _buildList() {
//     return Consumer<RestaurantDetailProvider>(
//       builder: (context, state, _) {
//         if (state.state == ResultState.Loading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (state.state == ResultState.HasData) {
//           var restaurant = state.result.restaurant;
//           return DetailContent(restaurant: restaurant);
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildList(),
//     );
//   }
// }