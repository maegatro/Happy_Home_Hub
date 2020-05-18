import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';
import 'dart:math';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // NOTE: we'll be moving this to a scoped_model later
    final locations = Location.fetchAll();

    int next(int min, int max) => min + Random().nextInt(max - min);

    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Home Hub'),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          GestureDetector(
            onTap: () => _onLocationTap(context, Random().nextInt(3) + 1) ,
            child: Text("Relax"),
          ),
          GestureDetector(
            onTap: () => _onLocationTap(context, next(4, 7)) ,
            child: Text("Learning"),
          ),
          GestureDetector(
            onTap: () => _onLocationTap(context, next(7, 10)) ,
            child: Text("Exercing"),
          )
        ],)
      ),
    );
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationID});
  }
}


// body: ListView(
//         children: locations
//             .map((location) => GestureDetector(
//                 onTap: () => _onLocationTap(context, location.id),
//                 child: Container(child: Text(location.name))))
//             .toList(),
//       ),
