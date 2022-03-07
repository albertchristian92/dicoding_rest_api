import 'package:flutter/material.dart';
import 'package:dicoding_rest_api/data/model/restaurant.dart';
import 'package:dicoding_rest_api/widgets/rating.dart';
import 'package:dicoding_rest_api/common/styles.dart';

class SpecialCard extends StatelessWidget {
  final Restaurant restaurant;
  final int index;

  const SpecialCard({
    required this.restaurant,
    required this.index
  });



  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(
              context, '/detail_page', arguments: restaurant.id);
        },

        child: index == 0 ? firstRestaurant(restaurant, context) : otherWidget(restaurant, context)
    );
  }

  Widget firstRestaurant(restaurant, context)=> Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
              width: MediaQuery.of(context).size.width*0.55,
              height: 250,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: blue,
                  boxShadow: [BoxShadow(spreadRadius: 0, offset: Offset(0,10), blurRadius: 0, color: blue.withOpacity(0.4))]
              ),
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage('https://restaurant-api.dicoding.dev/images/medium/' + restaurant.pictureId,
                                  ), fit: BoxFit.cover)
                              )
                          )
                  ),
                  SizedBox(height: 15,),
                  Text(restaurant.name, style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                  ),),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      restaurant.city,
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Rating(rating: restaurant.rating),
                  ),
                ],
            )
          ),
      ],
    );
  Widget otherWidget(restaurant,context)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Container(
            width: MediaQuery.of(context).size.width*0.35,
            height: 150,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: green,
                boxShadow: [BoxShadow(spreadRadius: 0, offset: Offset(0,10), blurRadius: 0, color: green.withOpacity(0.4))]
            ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                  image: NetworkImage('https://restaurant-api.dicoding.dev/images/medium/' + restaurant.pictureId,
                                  ), fit: BoxFit.cover)
                            )
                        ),
                      ),
                    SizedBox(height: 15,),
                    Text(restaurant.name, style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        restaurant.city,
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Rating(rating: restaurant.rating),
                    ),
                  ]
              )
          )
      ],
  );
}

