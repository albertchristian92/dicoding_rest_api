// import 'package:dicoding_rest_api/data/model/restaurant.dart';
// import 'package:dicoding_rest_api/ui/restaurant_detail_page.dart';
// import 'package:flutter/material.dart';
//
// class CardRestaurant extends StatelessWidget {
//   final Restaurant restaurant;
//
//   const CardRestaurant({required this.restaurant});
//
//   // void selectMeal(BuildContext ctx) {
//   //   Navigator.of(ctx)
//   //       .pushNamed(RestaurantDetailPage.routeName, arguments: restaurant)
//   //       .then((result) {
//   //     if (result != null) {
//   //       // removeItem(result);
//   //     }
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => selectMeal(context),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 4,
//         margin: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15)),
//                   child: Image.network(
//                     'https://restaurant-api.dicoding.dev/images/small/'+restaurant.pictureId,
//                     height: 250,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   right: 10,
//                   child: Container(
//                     width: 300,
//                     color: Colors.black54,
//                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                     child: Text(
//                       restaurant.name,
//                       style: TextStyle(fontSize: 26, color: Colors.white),
//                       softWrap: true,
//                       overflow: TextOverflow.fade,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.location_city,
//                       ),
//                       SizedBox(
//                         width: 6,
//                       ),
//                       Text(restaurant.city),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.rate_review,
//                       ),
//                       SizedBox(
//                         width: 6,
//                       ),
//                       Text(restaurant.rating.toString()),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
