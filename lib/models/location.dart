import './location_fact.dart';

/// Represents a tourism location a user can visit.
class Location {
  final int id;
  final String name;
  final String imagePath;
  final List<LocationFact> facts;

  Location(this.id, this.name, this.imagePath, this.facts);

  static List<Location> fetchAll() {
    return [
      Location(1, 'Relax', 'assets/images/netflix.png', [
        LocationFact(
            'Netflix', 'Why not watch Netflix and have some popcorns to relax'),
        // LocationFact('Tips', 'Japanese Buddhist architecture.'),
      ]),
      Location(2, 'Relax', 'assets/images/meditation.png', [
        LocationFact(
            'Meditation', 'Do meditation for 5 minutes. Sit comfortably, close your eyes, breath naturally, focus your attention on the breath.'),
        // LocationFact('Did You Know',
        //     'There are three cities that surround Mount Fuji: Gotemba, Fujiyoshida and Fujinomiya.'),
      ]),
      Location(3, 'Relax', 'assets/images/drink.png', [
        LocationFact('Drink', 'Get some drink and enjoy your time. Make a fancy cocktail for yourself.'),
        // LocationFact('How to Get There',
        //     'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
      ]),
      Location(4, 'Learning', 'assets/images/programming.png', [
        LocationFact(
            'Learn how to code', 'Follow a Javascript tutorial on youtube. If you are new to programming, you can start with HTML and CSS.'),
        // LocationFact('Did You Know',
        //     'There are three cities that surround Mount Fuji: Gotemba, Fujiyoshida and Fujinomiya.'),
      ]),
      Location(5, 'Learning', 'assets/images/arashiyama.jpg', [
        LocationFact('japanese', 'Plank for 1 minute'),
        // LocationFact('How to Get There',
        //     'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
      ]),
      Location(6, 'Learning', 'assets/images/arashiyama.jpg', [
        LocationFact('C++', 'Plank for 1 minute'),
        // LocationFact('How to Get There',
        //     'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
      ]),
      Location(7, 'Exercise', 'assets/images/arashiyama.jpg', [
        LocationFact('Plank', 'Plank for 1 minute'),
        // LocationFact('How to Get There',
        //     'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
      ]),
      Location(8, 'Exercise', 'assets/images/arashiyama.jpg', [
        LocationFact('pushups', 'Plank for 1 minute'),
        // LocationFact('How to Get There',
        //     'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
      ]),
      Location(9, 'Exercise', 'assets/images/arashiyama.jpg', [
        LocationFact('dancing', 'Plank for 1 minute'),
        // LocationFact('How to Get There',
        //     'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
      ]),
    ];
  }

  static Location fetchByID(int locationID) {
    // NOTE: this will replaced by a proper API call
    List<Location> locations = Location.fetchAll();
    for (var i = 0; i < locations.length; i++) {
      if (locations[i].id == locationID) {
        return locations[i];
      }
    }
    return null;
  }
}
