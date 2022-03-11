import 'package:flutter/material.dart';

class ErrorInformation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.error, size: 64, color: Color.fromRGBO(46, 71, 154, 1)),
        Text(
          'Whoops!',
          style: TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color.fromRGBO(17, 31, 101, 1)),
        ),
        SizedBox(height: 12),
        Text(
          'Slow or No Internet Connections woe',
          style: TextStyle(fontFamily: 'Open Sans', fontSize: 13),
        ),
        SizedBox(height: 6),
      ],
    );
  }
}