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
  Timer _timer;

  int _start;

  void startTimer(activity) {
    if (activity == "Meditation") {
      _start = 20;
    }

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner(location.imagePath),
            RaisedButton(
              onPressed: () {
                startTimer(location.facts[0].title);
              },
              child: Text("start"),
            ),
            Text("$_start"),
            Text(location.facts[0].title)
          ]..addAll(textSections(location))),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
