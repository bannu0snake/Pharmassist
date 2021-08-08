import 'package:flutter/material.dart';

class NoResultsFound extends StatelessWidget {
  const NoResultsFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: device.height*0.26,
        ),
        Icon(
          Icons.no_accounts,
          size: 70,
        ),
        SizedBox(height: device.height*0.02,),
        Text(
          'No results found',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
