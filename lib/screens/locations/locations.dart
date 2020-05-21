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
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Happy Home Hub'),
        backgroundColor: Colors.teal[900],
      ),
      body: SafeArea(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
          GestureDetector(
              onTap: () => _onLocationTap(context, Random().nextInt(3) + 1) ,
              child: Container(
                width: 348.0,
              height: 80.0,
                color: Colors.teal[800],
                child: Text("Relax", textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold,), 
                ),
              ),
            ),
          GestureDetector(
            onTap: () => _onLocationTap(context, next(4, 7)) ,
            child: Container(
              width: 348.0,
              height: 80.0,
              color: Colors.teal[800],
              child: Text("Learning", textAlign: TextAlign.center, style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold,),),
            ),
          ),
          GestureDetector(
            onTap: () => _onLocationTap(context, next(7, 10)) ,
              child: Container(
              width: 348.0,
              height: 80.0,
              color: Colors.teal[800],
              child: Text("Exercising", textAlign: TextAlign.center, style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold,),),
            ),          )
        ],),
        )
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
