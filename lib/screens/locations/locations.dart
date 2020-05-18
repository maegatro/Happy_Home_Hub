import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // NOTE: we'll be moving this to a scoped_model later
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Home Hub'),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          GestureDetector(
            onTap: () => _onLocationTap(context, 1) ,
            child: Text("Relax"),
          ),
          GestureDetector(
            onTap: () => _onLocationTap(context, 2) ,
            child: Text("Learning"),
          ),
          GestureDetector(
            onTap: () => _onLocationTap(context, 3) ,
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
