import 'package:flutter/material.dart';
import '../../models/location.dart';
import 'image_banner.dart';
import 'text_section.dart';
import 'dart:async';

class LocationDetail extends StatefulWidget {
  final int _locationID;

  LocationDetail(this._locationID);

  @override
  _LocationDetailState createState() => _LocationDetailState();
}

class _LocationDetailState extends State<LocationDetail> {
  // Timer _timer;

  // int _start;

  bool startActivity = false;

  int timeLeftInSec = 1800;
  Timer timer;
  int min;
  int sec;
  String minStr = '25';
  String secStr = '00';

  // void startTimer(activity) {
  //   if (activity == "Meditation") {
  //     _start = 20;
  //   }

  //   const oneSec = const Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSec,
  //     (Timer timer) => setState(
  //       () {
  //         if (_start < 1) {
  //           timer.cancel();
  //         } else {
  //           _start = _start - 1;
  //         }
  //       },
  //     ),
  //   );
  // }

  void startOrStop(activity) {
    if (timeLeftInSec == 0) {
      timeLeftInSec = 10;
    }

    if (activity == "Drink" || activity == "Netflix") {
      minStr = "60";
      timeLeftInSec = 3600;
    } else if (activity == "Meditation") {
      timeLeftInSec = 5;
    }

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeftInSec > 0) {
          timeLeftInSec--;
          min = (timeLeftInSec / 60).truncate();
          minStr = (min % 60).toString().padLeft(2, '0');
          sec = timeLeftInSec - min * 60;
          secStr = sec.toString().padLeft(2, '0');
        } else {
          // final player = AudioCache();
          // player.play('bikehorn.wav');
          timer.cancel();
//          timeLeftInSec = 10;
        }
      });
    });
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    // NOTE: we'll be moving this to a scoped_model later
    final location = Location.fetchByID(widget._locationID);

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(location.name),
        backgroundColor: Colors.teal[900],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner(location.imagePath),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: RaisedButton(
                // padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  // startTimer(location.facts[0].title);
                  startOrStop(location.facts[0].title);
                  startActivity = true;
                },
                child: Text(
                  "Press Here To Start",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.teal[900],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico'),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
                child: startActivity == true
                    ? Text('$minStr : $secStr',
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico'))
                    : Text("00 : 00",
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico'))),
            // Text('$minStr : $secStr')
          ]..addAll(textSections(location))),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
